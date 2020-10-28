#!/usr/bin/env python


## Simple talker demo that published std_msgs/Strings messages
## to the 'chatter' topic

import rospy
import numpy as np 

from std_msgs.msg import String 
from geometry_msgs.msg import Twist 

def get_pos():
    pub = rospy.Publisher('position_xy', Twist)
    rospy.init_node('get_pos', anonymous=True)
    rate = rospy.Rate(8) # 1 hz
    
    x = 5
    y = 7

    position = Twist()
    position.linear.x = x
    position.linear.y = y


    while not rospy.is_shutdown():
        # play_str = "play %s" % rospy.get_time()
        pub.publish(position)
        rospy.loginfo(position)
        rate.sleep()

if __name__ == '__main__':
    try:
        get_pos()
    except rospy.ROSInterruptException:
        pass