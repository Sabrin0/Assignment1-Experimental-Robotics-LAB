#!/usr/bin/env python

from __future__ import print_function
from package1.srv import Nav,NavResponse
import rospy

#class construct that initialize the node and then create a service and defines the type, name, and callback.

class NavigationService(Node):
    
    def __init__(Self)
    super().__init__("navigation_serivice")
    self.srv = self.create_service()