#!/usr/bin/env python

from __future__ import print_function

from package1.srv import Nav,NavResponse
import rospy

def handle_nav(req):
    print("Given [%d and %d ]" %(req.x, req.y))
    return NavResponse(1)

def nav_server():
    rospy.init_node('nav_server')
    s = rospy.Service('nav_service', Nav, handle_nav)
    print("Ready to go \(._.)/")
    rospy.spin()

if __name__ == "__main__":
    nav_server()