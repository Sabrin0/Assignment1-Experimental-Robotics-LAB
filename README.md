# Experimental Robotics LAB: First Assignment

## Introduction

The main purpose of this project is to design a **behavioral architecture** that simulates a robot pet interacting with a human. In particular, the human can interact by **pointing gesture** and **speech commands** in order to *activate* the robots and make it move to a desired position. If the robot doesn't receive any command, however it can follow other two different behavior:

* **Normal**: in which it moves randomly
* **Sleep**: in which it reaches a predefined location and waits for some time

## Software Architecture
 
For this particular *scenario* I decided to implement a simple software architecture composed by three ROS nodes and one single service.

* `user_play.py` A ROS node that publishes a string "play" in order to simulate the human interaction. The aforementioned command is published at random time.

* `get_pos.py` A ROS node that publishes random 2D coordinates (x,y) inside the integer domain. The map is considered as a matrix of dimension 10x10. In this way it could be possible to simulate the **normal** behavior in which the robot moves randomly.

* `cmd_manager.py` It's the implementation of the *command manger*. Basically it's a ROS node, in which is contained the finite state machine. This node, it's also a ROS *subscriber* that takes into account the parameters passed by the two *publishers*. In this way it can handle the three different state (*play*,*normal* and *sleep*).

* `Nav.py` It's a ROS service that simulates the robots movements. For this reason it receives two target coordinates as request, then it returns a response with the robot position.

## Workspace

### Packages and files list

There is one package called `package1` and inside the `package1/scripts` directory the aforementioned scripts are stored. While the `msg` and `srv` files are respectively stored in the `package1/msg` and `package1/srv` directories.

### Installation and running procedure

Firstof all, in order to configure the ROS environment inside the current *workspace* the commands `catkin_make` is required as well as the sourcing of the setup.*sh files. The in different terminals run:

```
$ roscore 
$ rosrun package1 user_play.py
$ rosrun package1 get_pos.py
$ rosrun package1 Nav.py
$ rosrun package1 cmd_man.py

```
The firs command must be run in order for ROS nodes to communicate. Then, with the others, several *log infos* will be displayed. In particular the string `play`, the position generated by `get_pos`, the notices of the service and obviously the behavior of the **FSM**. In this way, once a parameter is published, the FSM can proceed to change the state, but some limitation occurs as described below. 

## System Limitation 

* The human interaction is aperiodic, but it's handle by an automatic algorithm. The user has no way to communicate with the robot.

* The human position is fixed and the robot is not able to follow him.

* Only **x** and **y** coordinates are taken into account, there is no orentation of the robots.
 
* There is no way to detect and avoid obstacles

##  System Improvements 

* Add a node that interfaces with the user, able to recognize speak command and update the target coordinates based on the human current position

* Implement an obstacle recognition and a more realistic behavior of the robot as a pet

# Contacts

Luca Covizzi luca@francocovizzi.it



 
    
 
