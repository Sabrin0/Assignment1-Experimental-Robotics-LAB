#!/usr/bin/env python
import roslib; roslib.load_manifest('package1')

## Simple talker demo that listens to std_msgs/Strings published 
## to the 'chatter' topic
import sys
import rospy
import package1.msg

from std_msgs.msg import String
from geometry_msgs.msg import Twist
from package1.srv import * #prendi tutto



def nav_client(x,y):
    rospy.wait_for_service('nav_service')
    
    try:
        nav_service = rospy.ServiceProxy('nav_service', Nav)

        request = package1.msg.Position(x,y)
        rospy.loginfo("Sono arrivato x : %d e y : %d",request.x,request.y)
        response = nav_service(request)
        return response

    except rospy.ServiceException as e:
        print("Service call failed: %s" %e )

#def usage():
#    return "%s [x y]" %sys.argv[0]

def callback_user(data):
    rospy.loginfo(rospy.get_caller_id() + 'I heard %s', data.data)

def callback_pos(data):
    rospy.loginfo(rospy.get_caller_id() + 'I heard x: %d y: %d', data.linear.x, data.linear.y)
    rate = rospy.Rate(3)   
    nav_client(data.linear.x,data.linear.y)
    rate.sleep()

def cmd_man():
    
    rospy.init_node('cmd_man', anonymous=True)
    rospy.Subscriber('chatter', String, callback_user)
    rospy.Subscriber('position_xy', Twist, callback_pos)
    
    
    #loop = 1
    
   
    print(":(")
    # rate = rospy.Rate(5)

    # while loop == 1:
    
    print(":((")
    # rate.sleep()

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    
    cmd_man()

#    if len(sys.argv) == 3:
#        x = int(sys.argv[1])
#        y = int(sys.argv[2])
#    else:
#        print(usage())
#        sys.exit(1)
#    print("Requesting %s+%s"%(x, y))
#    print("%s + %s = %s"%(x, y, nav_client(x, y)))
