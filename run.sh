#! /bin/bash
## 更换仿真时时只需修改vehicle_test.launch中的车辆模型和rviz文件即可

source install/setup.bash
roslaunch weichai_sim vehicle_test.launch
