#!/usr/bin/env python


## Simple talker demo that published std_msgs/Strings messages
## to the 'chatter' topic

import rospy
import numpy as np 
import random
import time 

from std_msgs.msg import String 
from geometry_msgs.msg import Twist 


# Generate random values periodically

def get_pos():

    pub = rospy.Publisher('position_xy', Twist, queue_size= None)
    rospy.init_node('get_pos', anonymous=True)
    rate = rospy.Rate(1) # 1 hz
   
    while not rospy.is_shutdown():
        
        x = random.randint(0,10)
        y = random.randint(0,10)
        position = Twist()
        position.linear.x = x
        position.linear.y = y
        pub.publish(position)
        rospy.loginfo(position)
        time.sleep(10)

if __name__ == '__main__':
    try:
        get_pos()
    except rospy.ROSInterruptException:
        passs