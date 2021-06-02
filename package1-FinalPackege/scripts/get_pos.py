#!/usr/bin/env python

"""!
@section Description
It's a simple ROS node that passes to the topic command manager a geometry message.
In that way we are able to simulate a pointing gesture, by reproducing randomply 2d coordinates 
"""

# Imports
import rospy
import numpy as np 
import random
import time 

from std_msgs.msg import String 
from geometry_msgs.msg import Twist 


# Function

def get_pos():
    """! 
    @param x random values between 0 and 10 representing the x coordinate
    @param y random values between 0 and 10 representing the y coordinate
    """
    ## The node is publishing to the position_xy topic, using the geometry msg Twist
    pub = rospy.Publisher('position_xy', Twist, queue_size= None)
    ## Declaring  the name of the node: get_pos 
    rospy.init_node('get_pos', anonymous=True)
    rate = rospy.Rate(1) 
   
    while not rospy.is_shutdown():
        
        x = random.randint(0,10)
        y = random.randint(0,10)
        position = Twist()
        position.linear.x = x
        position.linear.y = y
        ## Publishing the position to the get_pos topic
        pub.publish(position)
        rospy.loginfo(position)
        time.sleep(10)

if __name__ == '__main__':
    try:
        get_pos()
    except rospy.ROSInterruptException:
        passs