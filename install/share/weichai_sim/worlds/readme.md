# 场景搭建（静态障碍物）加载说明

gazebo模型库https://github.com/osrf/gazebo_models下载模型，并将下载的模型以及自己搭建的模型(`${path to}/仿真模型`)放入路径`/.gazebo/models`，打开gazebo后在左侧`Insert`窗口下可选择加载模型。

## 1. 场景设置

潍柴园区场景已经根据.osm语义地图导出为对应的3D路面模型，模型路径为`${path to}/仿真模型/weichai`。用户可根据需求结合Gazebo场景库中的其他模型进行场景的构建与生成。

## 2. 动态障碍物

gazebo教程：http://gazebosim.org/tutorials?tut=actor&cat=build_robot

动态障碍物加载要求gazebo版本为8.0+

**参考场景文件：`simple_city.world`**

### 2.1 行人

2.1.1 修改`<skin>`标签中文件选择行人衣服颜色
- SKIN_man_blue_shirt.dae
- SKIN_man_green_shirt.dae
- SKIN_man_red_shirt.dae

2.1.2 修改`<animation>`标签中文件选择行人的状态(行走、奔跑、对话)
- ANIMATION_walking.dae 
- ANIMATION_talking_a.dae
- ANIMATION_talking_b.dae
- ANIMATION_running.dae

2.1.3 修改标签`</trajectory>`描述要遵循的一系列关键帧。它具有两个属性：唯一性id和type，轨迹参数如下：
  - waypoint：轨迹中可以有任意数量的航点。每个航点由一个time和pose：
  -  time：以秒为单位的时间（从脚本开始算起）应达到的姿势
  -  pose：应达到的姿势

#### 示例(行人)

```

  <actor name="walking_4">
            <!-- Starting pose -->
            <pose>93.33 31.75 0.01 0 0 0</pose>
            <skin>
               <filename>model://actor/meshes/SKIN_man_green_shirt.dae</filename>
            </skin>
            <animation name="animation">
               <filename>model://actor/meshes/ANIMATION_walking.dae</filename>
           <interpolate_x>true</interpolate_x>  
          </animation>
          <script>
            <trajectory id="0" type="animation">
                <waypoint>
                  <time>0</time>
                  <pose>93.33 31.75 0.01 0 0 3.14</pose>
                </waypoint>
                <waypoint>
                  <time>5.604188451265503</time>
                  <pose>85.49 32.05 0.01 0 0 3.14</pose>
                </waypoint>
                <waypoint>
                  <time>6.664607296392053</time>
                  <pose>85.49 32.05 0.01 0 0 0</pose>
                </waypoint>
                <waypoint>
                  <time>11.208376902531006</time>
                  <pose>93.33 31.75 0.01 0 0 0</pose>
                </waypoint>
                <waypoint>
                  <time>12.268795747657556</time>
                  <pose>93.33 31.75 0.01 0 0 3.14</pose>
                </waypoint>
            </trajectory>
          </script>
          </actor>
``` 
### 2.2 车辆

2.2.1 修改`<uri>`标签中文件选择车辆类型
- suv
- pickup
- ambulance
- bus
- fire_truck
- prius_hybrid

#### 示例(车辆)
```
<actor name="car_001">
    <include>
      <name>suv_001</name>
      <uri>model://suv</uri>
    </include>

    <script>
      <trajectory id="0" type="animation">      
              <waypoint>
                <time>0</time>
                <pose>118.16 18.24 0.01 0 0 3.18</pose>
              </waypoint>
              <waypoint>
                <time>30</time>
                <pose>-97.65 12.61 0.01 0 0 3.18</pose>
              </waypoint>  
      </trajectory>
    </script>
</actor>
```

## 3. 卸载gazebo7安装gazebo9
### 3.1. 卸载gazebo7：

```
sudo apt-get remove gazebo7 gazebo7-common gazebo7-plugin-base libgazebo7:amd64 libgazebo7-dev:amd64
```

### 3.2. 安装gazebo9

```
sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
 wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
 sudo apt-get update
 sudo apt-get install gazebo9
```

### 3.3. 插件安装

```
sudo apt-get install ros-kinetic-gazebo9-ros-control  ros-kinetic-gazebo9-ros-pkgs
```

## 3. 卸载gazebo9
```
sudo apt-get remove gazebo9 ros-kinetic-gazebo9-ros-control ros-kinetic-gazebo9-ros-pkgs
```