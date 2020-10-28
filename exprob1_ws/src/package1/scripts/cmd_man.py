#!/usr/bin/env python

## Simple talker demo that listens to std_msgs/Strings published 
## to the 'chatter' topic

import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist
from package1.srv import * #prendi tutto

def nav_client(x,y):
    rospy.wait_for_service('nav_service')
    try:
        go_to = rospy.ServiceProxy('nav_service',Nav)
        response = go_to(x,y)
        return response.p
    except rospy.ServiceException as e:
        print("Service call failed: %s" %e )

def callback_user(data):
    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', data.data)

def callback_pos(data):
    rospy.loginfo(rospy.get_caller_id() + 'I heard x: %d y: %d', data.linear.x, data.linear.y)

def cmd_man():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    
    rospy.init_node('cmd_man', anonymous=True)

    rospy.Subscriber('chatter', String, callback_user)
    rospy.Subscriber('position_xy', Twist, callback_pos)
    loop = 1
    x = 1
    y= 1
    rate = rospy.Rate(5)

    while loop == 1:
        nav_client(x,y)
        rate.sleep()

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    cmd_man()
