#!/usr/bin/env python2

from __future__ import print_function

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


# Initialize target position
x_pos = 0
y_pos = 0

# Define home position 
x_home = 5
y_home = 5

# Define person position 

x_person = 0
y_person = 0

state = 'NoInfo'

def decision():
    return random.choice(['goToNormal','goToSleep'])

# callback related to target position

def callback_pos(data):
    global x_pos
    x_pos = data.linear.x
    global y_pos 
    y_pos = data.linear.y

# callback related to user command request 

def callback_user(data):
    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', data.data)
    global state
    state = "play"

def nav_client(x,y):
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

# define Normal state

class Normal(smach.State):
    def __init__(self):
        # initialisation function, it should not wait
        smach.State.__init__(self, 
                             outcomes=['GoToNormal','GoToSleep','GoToPlay'],
                             input_keys=['unlocked_counter_in'],
                             output_keys=['unlocked_counter_out'])
        self.rate = rospy.Rate(1)  # Loop at 1 Hz
        self.counter = 0
        
    def execute(self,userdata):
        # function called when exiting from the node, it can be blacking
        # time.sleep(3)
        global x_pos
        global y_pos
        global state
        
        self.counter = random.randint(1,2)

        while not rospy.is_shutdown():  
            rospy.loginfo(rospy.get_caller_id() + 'Executing state NORMAL ')
        # userdata.unlocked_counter_out = userdata.unlocked_counter_in + 1
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

# define Sleep state

class Sleep(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['GoToNormal','GoToSleep'],
                             input_keys=['locked_counter_in'],
                             output_keys=['locked_counter_out'])
        self.sensor_input = 0
        self.rate = rospy.Rate(50)  # Loop at 50 Hz

    def execute(self, userdata):
        # simulate that we have to get 5 data samples to compute the outcome
        time.sleep(5)
        global x_home
        global y_home
        rospy.loginfo(rospy.get_caller_id() + 'Executing state SLEEP ')
        nav_client(x_home,y_home)
        rospy.loginfo(rospy.get_caller_id() + 'Back home x: %d y: %d',x_home,y_home)
        self.rate.sleep()
        return 'goToNormal'

## defines the PLAY state

class Play(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['GoToNormal','GoToPlay'],
                             input_keys=['locked_counter_in'],
                             output_keys=['locked_counter_out'])
        
        self.rate = rospy.Rate(50)  # Loop at 50 Hz

    def execute(self, userdata):
        # simulate that we have to get 5 data samples to compute the outcome
        global x_pos
        global y_pos 

        nav_client(x_pos,y_pos)
        nav_client(x_person,y_person)

        rospy.loginfo(' Executing state PLAY ')
        time.sleep(3)

        return 'GoToNormal'       


def main():

    rospy.init_node('smach_example_state_machine')
    rospy.Subscriber('chatter', String, callback_user)
    rospy.Subscriber('position_xy', Twist, callback_pos)
    
    # Create a SMACH state machine
    sm = smach.StateMachine(outcomes=['container_interface'])
    sm.userdata.sm_counter = 0

    # Open the container
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