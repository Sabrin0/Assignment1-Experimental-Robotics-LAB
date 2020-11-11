#!/usr/bin/env python

"""!
@author Luca Covizzi
@mainpage Assignment 1 Exprob
@package cmd_man
@section Description
This script implements a ROS node that is a subscriber of get_pos and user_play publishers and at the same time it implements the FSM.
In this way, according to the command stored, it's possible to resarch the desired state.   
"""

from __future__ import print_function

# Imports
import roslib; roslib.load_manifest('package1')
import rospy
import smach
import smach_ros
import time
import random
import sys
import package1.msg
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from package1.srv import * 

# Global Constants
## Initialize target x position
x_pos = 0
## Initialize target y position
y_pos = 0

## Define home x position 
x_home = 5
## Define home y position 
y_home = 5

## Define person x position 
x_person = 0
## Define person x position
y_person = 0

## Initial state
state = 'NoInfo'

# Functions 
def decision():
    """! return random state between GoTonormal or GoToSleep"""
    return random.choice(['GoToNormal','GoToSleep'])



def callback_pos(data):
    """! Callback related to target position
    @param x_pos x positon of the robot
    @param y_pos y position of the robot
    """
    global x_pos
    x_pos = data.linear.x
    global y_pos 
    y_pos = data.linear.y

def callback_user(data):
    """! Callback related to user command request 
    @param state string that actives the PLAY state
    """
    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', data.data)
    global state
    state = "play"

def nav_client(x,y):
    """! Client function for the navigation service 
    @param x_pos x positon of the robot
    @param y_pos y position of the robot
    @param x_home y position of home
    @param y_home y position of home
    @return response of navigation service
    """
    global x_pos
    global y_pos
    global x_home
    global y_home

    rospy.wait_for_service('nav_service')

    try:
        nav_service = rospy.ServiceProxy('nav_service', Nav)
        request = package1.msg.Position(x,y)
        rospy.loginfo("I'm arrived to x : %d e y : %d",request.x,request.y)
        response = nav_service(request)
        return response

    except rospy.ServiceException as e:
        print("Service call failed: %s" %e )

class Normal(smach.State):
    """! Define normal state """
    def __init__(self):
        """! initialisation function, it should not wait 
        @param outcomes outcomes of the state
        @param input_keys counter in
        @param output_keys counter out
        """
        smach.State.__init__(self, 
                             outcomes=['GoToNormal','GoToSleep','GoToPlay'],
                             input_keys=['unlocked_counter_in'],
                             output_keys=['unlocked_counter_out'])
        self.rate = rospy.Rate(1) 
        self.counter = 0
        
    def execute(self,userdata):
        """! Normal state execution 
        @param x_pos x positon of the robot
        @param y_pos y position of the robot
        @return state researched
        """
        # time.sleep(3)
        global x_pos
        global y_pos
        global state
        
        self.counter = random.randint(1,2)

        while not rospy.is_shutdown():  
            rospy.loginfo(rospy.get_caller_id() + 'Executing state NORMAL ')
            time.sleep(1)

            if state == "play":
                state = 'noInput'
                return 'GoToPlay'

            if self.counter == 3:
                return 'GoToSleep'

            rospy.loginfo('i m going to x: %d y: %d',x_pos, y_pos)
            nav_client(x_pos,y_pos)            
            self.counter += 1

        return 'GoToSleep'

class Sleep(smach.State):
    """! Define Sleep state """
    def __init__(self):
        """! initialisation function, it should not wait 
        @param outcomes outcomes of the state
        @param input_keys counter in
        @param output_keys counter out
        """
        smach.State.__init__(self, 
                             outcomes=['GoToNormal','GoToSleep'],
                             input_keys=['locked_counter_in'],
                             output_keys=['locked_counter_out'])
        self.sensor_input = 0
        self.rate = rospy.Rate(50)  # Loop at 50 Hz

    def execute(self, userdata):
        """! Sleep state execution 
        @param x_home x positon of the home
        @param y_home y position of the home
        @return state Normal
        """
        time.sleep(5)
        global x_home
        global y_home
        rospy.loginfo(rospy.get_caller_id() + 'Executing state SLEEP ')
        nav_client(x_home,y_home)
        rospy.loginfo(rospy.get_caller_id() + 'Back home x: %d y: %d',x_home,y_home)
        self.rate.sleep()
        return 'GoToNormal'

class Play(smach.State):
    """! Define Play state """
    def __init__(self):
        """! initialisation function, it should not wait 
        @param outcomes outcomes of the state
        @param input_keys counter in
        @param output_keys counter out
        """
        smach.State.__init__(self, 
                             outcomes=['GoToNormal','GoToPlay'],
                             input_keys=['locked_counter_in'],
                             output_keys=['locked_counter_out'])
        
        self.rate = rospy.Rate(50)  # Loop at 50 Hz

    def execute(self, userdata):
         """! Play state execution 
        @param x_pos x positon of the robot
        @param y_pos y position of the robot
        @param x_home y position of home
        @param y_home y position of home
        @return GoToNormal state
        """
        global x_pos
        global y_pos 

        nav_client(x_pos,y_pos)
        nav_client(x_person,y_person)

        rospy.loginfo(' Executing state PLAY ')
        time.sleep(3)

        return 'GoToNormal'       


def main():
    
    rospy.init_node('smach_example_state_machine')
    ## Node subscribes to chatter topic
    rospy.Subscriber('chatter', String, callback_user)
    ## Node subscribes to position_xy topic
    rospy.Subscriber('position_xy', Twist, callback_pos)
    
    ## Create a SMACH state machine
    sm = smach.StateMachine(outcomes=['container_interface'])
    sm.userdata.sm_counter = 0

    ## Open the container
    with sm:
        # Add states to the container
        smach.StateMachine.add('NORMAL', Normal(), 
                               transitions={'GoToSleep':'SLEEP', 
                                            'GoToNormal':'NORMAL',
                                            'GoToPlay':'PLAY'},
                               remapping={'locked_counter_in':'sm_counter', 
                                          'locked_counter_out':'sm_counter'})
        smach.StateMachine.add('SLEEP', Sleep(), 
                               transitions={'GoToSleep':'SLEEP', 
                                            'GoToNormal':'NORMAL'},
                               remapping={'unlocked_counter_in':'sm_counter',
                                          'unlocked_counter_out':'sm_counter'})
        smach.StateMachine.add('PLAY', Play(),
                                transitions={'GoToNormal':'NORMAL',
                                             'GoToPlay':'PLAY'},
                                remapping={'unlocked_counter_in':'sm_counter',
                                           'unlocked_counter_out':'sm_counter'})

    # Create and start the introspection server for visualization
    sis = smach_ros.IntrospectionServer('server_name', sm, '/SM_ROOT')
    sis.start()

    # Execute the state machine
    outcome = sm.execute()

    # Wait for ctrl-c to stop the application
    rospy.spin()
    sis.stop()


if __name__ == '__main__':
    main()