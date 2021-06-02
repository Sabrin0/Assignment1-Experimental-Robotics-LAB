#!/usr/bin/env python

"""!
@section Description
Simple server that simalute the navigation of the robot. 
It handle the request of client, which is the cmd_man. In this case the request correspond to the 2d postion of the map
"""

# Import 
from __future__ import print_function
import roslib;roslib.load_manifest('package1')
import package1.msg

from package1.srv import Nav,NavResponse 

import rospy
import time

# Function

def nav_response(req):
    """!
    @param nx new x position
    @param ny new y position
    @return navigation response 
     """
    print("Given [%d and %d ]" %(req.in_.x, req.in_.y))
    print("Please wait I am moving")
    nx = req.in_.x
    ny = req.in_.y
    response = package1.msg.NewPosition(nx,ny)
    time.sleep(5)
    return NavResponse(response)


def nav_server():
    """!
    Declaring the node and the service in order to pass the request to the nav_response function. 
    """
    rospy.init_node('nav_server')
    s = rospy.Service('nav_service', Nav, nav_response) 
    print("Ready to go")
    rospy.spin()

if __name__ == "__main__":
    nav_server()