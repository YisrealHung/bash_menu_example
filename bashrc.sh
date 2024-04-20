#!/bin/bash

echo "請選擇一個功能："
echo "1. ROS 2 Humble bringup"
echo "2. ROS 2 Humble teleop_keyboard"
echo "3. ROS 2 Humble slam_gmapping"
echo "4. ROS 2 Humble save map"
echo "5. ROS 2 Humble navigation"
echo "6. rviz2"
echo "7. pass"

read -p "請輸入數字（1-7）：" choice

case $choice in
    1)
        clear
        export ROS_DOMAIN_ID=97
        export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
        source /opt/ros/humble/setup.bash
        source /home/yisreal/ros2_ws/install/setup.bash
        ros2 launch smartrobot ominibot_rplidar_launch.py
        ;;
	
    2)
        clear
        export ROS_DOMAIN_ID=97
        export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
        source /opt/ros/humble/setup.bash
        source /home/yisreal/ros2_ws/install/setup.bash
        ros2 run rosmaze_teleop_keyboard rosmaze_teleop_keyboard
        ;;
    3)
        clear
        export ROS_DOMAIN_ID=97
        export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
        source /opt/ros/humble/setup.bash
        source /home/yisreal/ros2_ws/install/setup.bash
        ros2 launch smartrobot slam_gmapping.launch.py
        ;;
    4)
        clear
        export ROS_DOMAIN_ID=97
        export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
        source /opt/ros/humble/setup.bash
        source /home/yisreal/ros2_ws/install/setup.bash
        
        read -p "請輸入地圖名稱：" mapname
        ros2 run nav2_map_server map_saver_cli -f $mapname".yaml" 
        ;;
    5)
        clear
        export ROS_DOMAIN_ID=97
        export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
        source /opt/ros/humble/setup.bash
        source /home/yisreal/ros2_ws/install/setup.bash
        
        read -p "請輸入地圖名稱：" mapname
        ros2 launch smartrobot nav2_launch.py map:=$mapname".yaml" 
        ;;
    6)
        clear
        export ROS_DOMAIN_ID=97
        export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
        source /opt/ros/humble/setup.bash
        source /home/yisreal/ros2_ws/install/setup.bash
        rviz2 -d rviz_config_nav.rviz
        ;;
    7)
    	clear
    	;;
    *)
        echo "無效的選擇"
        ;;
esac
