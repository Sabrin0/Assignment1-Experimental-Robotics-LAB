#!/usr/bin/env python

from __future__ import print_function
import roslib;roslib.load_manifest('package1')
import package1.msg

from package1.srv import Nav,NavResponse 


import rospy
import time
# from geometry_msgs.msg import Twist

def nav_response(req):
    print("Given [%d and %d ]" %(req.in_.x, req.in_.y))
    print("Please wait I am tired and old")
    nx = req.in_.x
    ny = req.in_.y
    # position = Twist()
    # position.linear.x = req.x
    # position.linear.y = req.y
    response = package1.msg.NewPosition(nx,ny)
    time.sleep(5)
    return NavResponse(response)


def nav_server():
    rospy.init_node('nav_server')
    s = rospy.Service('nav_service', Nav, nav_response) 
    print("Ready to go \(._.)/")
    rospy.spin()

if __name__ == "__main__":
    nav_server()