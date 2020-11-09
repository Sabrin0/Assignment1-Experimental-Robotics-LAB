#!/usr/bin/env python2


## Simple talker demo that published std_msgs/Strings messages
## to the 'chatter' topic

import rospy
from std_msgs.msg import String

def user_play():
    pub = rospy.Publisher('chatter', String)
    rospy.init_node('user_play', anonymous=True)
    rate = rospy.Rate(1) # 1 hz
    while not rospy.is_shutdown():
        play_str = "play %s" % rospy.get_time()
        rospy.loginfo(play_str)
        pub.publish(play_str)
        rate.sleep()

if __name__ == '__main__':
    try:
        user_play()
    except rospy.ROSInterruptException:
        pass
