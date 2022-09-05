# weichai_sim_ws
## １．概要

当前仿真模块支持山东汽车模型仿真、多传感器仿真以及场景仿真，主要用于传感器部署方案验证。工作空间内包含的程序包的名称及作用如下：

- **weichai_sim: 山东汽车的仿真程序包**(车辆+多传感器+场景)
- **velodyne_description: 基于velodyne模型自建的LIVOX程序包**



## ２．平台环境及依赖

- OS: Ubuntu 18.04 
- RＯS: Melodic
- **Gazebo 9.19版本** & RVIZ


### ３. 仿真模型

自行构建的车辆及环境模型，用于在Gazebo中进行场景创建或者在launch文件中的加载。

#### 安装：

- `cd`至仿真模型所在文件夹
- 执行命令`cp -vfR * "$HOME/.gazebo/models/"`



### ４. 仿真场景

已完成的仿真场景为`.world`格式，存放于`weichai_sim`程序包下的`worlds`文件夹内。主要场景包括：

* empty_sky.world：空场景
* environment_test.world：局部环境测试场景
* parkinglot.world：停车场场景
* simple_city.world：简单城市场景
* test_track.world：道路测试场景


### ５．仿真传感器

主要包含：

* 相机（待补充）
* 多线激光雷达（已完成，见velodyne相关程序包）
* 超声波雷达（待补充）
* GPS（待补充）
* IMU（待补充）
* ......

### 6. 使用方法

#### 加载传感器部署方案的模型以及场景
``$ cd simplatform
  $ source install/setup.bash
  $ roslaunch weichai_sim vehicle_test.launch``

### 7. 后续开发

#### 后续传感器仿真开发：

#####（1）下载开源模型源码
##### (2) 修改模型接口，生成自定义功能模型库函数(修改传感器的urdf)
##### (3) 加载自定义模型（完成参数设置）

