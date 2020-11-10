#!/usr/bin/env python

from __future__ import print_function

import roslib
import rospy
import smach
import smach_ros
import time
import random
import sys

from std_msgs.msg import String
from geometry_msgs.msg import Twist
from package1.srv import *
# from get_pos import get_pos


# Initialize target position
x_pos = 0
y_pos = 0
# Initialize home position 
homeX = 0
homeY = 0

# callback related to target position

def callback_pos(data):
    global x_pos
    x_pos = data.linear.x
    global y_pos 
    y_pos = data.linear.y

#    return data

# callback related to user command request 

def callback_user(data):
    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', data.data)
    global state
    state = "play"


def nav_client(x,y):
    global x_pos
    global y_pos
    global homeX
    global homeY

    rospy.wait_for_service('nav_service')
    try:
        nav_service = rospy.ServiceProxy('nav_service',Nav)
        response = nav_service(x,y)
        return response.nx
    except rospy.ServiceException as e:
        print("Service call failed: %s" %e )


def decision():
    return random.choice(['goToNormal','goToSleep'])

# define state Unlocked
class Normal(smach.State):
    def __init__(self):
        # initialisation function, it should not wait
        smach.State.__init__(self, 
                             outcomes=['goToNormal','goToSleep'],
                             input_keys=['unlocked_counter_in'],
                             output_keys=['unlocked_counter_out'])
        self.rate = rospy.Rate(1)  # Loop at 200 Hz
        self.counter = 0
        
    def execute(self,userdata):
        # function called when exiting from the node, it can be blacking
        time.sleep(3)
        global x_pos
        global y_pos
        
        while not rospy.is_shutdown():  
            rospy.loginfo(rospy.get_caller_id() + 'Executing state NORMAL ')
        # userdata.unlocked_counter_out = userdata.unlocked_counter_in + 1

            if self.counter == 3:
                return 'goToSleep'
            time.sleep(1)
            rospy.loginfo(rospy.get_caller_id() + 'i m going to x: %d y: %d',x_pos, y_pos)
            nav_client(x_pos,y_pos)
            
            self.counter += 1
            
        return 'GoToSleep'
    

# define state Locked
class Sleep(smach.State):
    def __init__(self):
        smach.State.__init__(self, 
                             outcomes=['goToNormal','goToSleep'],
                             input_keys=['locked_counter_in'],
                             output_keys=['locked_counter_out'])
        self.sensor_input = 0
        self.rate = rospy.Rate(50)  # Loop at 200 Hz

    def execute(self, userdata):
        # simulate that we have to get 5 data samples to compute the outcome
        time.sleep(5)
        #            navigation(x,y)
        global homeX
        global homeY
        rospy.loginfo(rospy.get_caller_id() + 'Executing state SLEEP ')
        rospy.loginfo(rospy.get_caller_id() + 'I am going to home x: %d y: %d',homeX,homeY)
        self.rate.sleep()
        return 'goToNormal'


        
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
                               transitions={'goToSleep':'SLEEP', 
                                            'goToNormal':'NORMAL'},
                               remapping={'locked_counter_in':'sm_counter', 
                                          'locked_counter_out':'sm_counter'})
        smach.StateMachine.add('SLEEP', Sleep(), 
                               transitions={'goToSleep':'SLEEP', 
                                            'goToNormal':'NORMAL'},
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
