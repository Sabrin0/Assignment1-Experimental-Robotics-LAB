#!/usr/bin/env python

#Simple node that passes to the command manager a string "play" in order to reach the PLAY state

import rospy
import time
import random
from std_msgs.msg import String

def user_play():
    pub = rospy.Publisher('chatter', String)
    rospy.init_node('user_play', anonymous=True)
    rate = rospy.Rate(1) # 1 hz
    while not rospy.is_shutdown():
        play_str = "play"
        rospy.loginfo(play_str)
        pub.publish(play_str)
        time.sleep(random.randint(0,20))

if __name__ == '__main__':
    try:
        user_play()
    except rospy.ROSInterruptException:
        pass
