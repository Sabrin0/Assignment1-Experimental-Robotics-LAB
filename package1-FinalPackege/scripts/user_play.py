#!/usr/bin/env python

"""!
@package user_play
@section Description
It's a simple ROS node that passes to the topic command manager a string "play", with random times interval,  in order to reach the PLAY state 
"""

# Imports
import rospy
import time
import random
from std_msgs.msg import String

# Functions
def user_play():

    """! 
    @param play_str string published 
    """
    pub = rospy.Publisher('chatter', String)
    rospy.init_node('user_play', anonymous=True)
    rate = rospy.Rate(1) 
    while not rospy.is_shutdown():
        play_str = "play"
        rospy.loginfo(play_str)
        pub.publish(play_str)
        time.sleep(random.randint(0,20)) # Wait random time between 0 and 20 sec

if __name__ == '__main__':
    try:
        user_play()
    except rospy.ROSInterruptException:
        pass
