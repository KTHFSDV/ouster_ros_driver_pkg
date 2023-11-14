#!/usr/bin/env docker

# This is a template for a Dockerfile to build a docker image for your ROS package. 
# The main purpose of this file is to install dependencies for your package.

FROM ros:noetic-ros-base-focal        

ENV ROS_ROOT=/opt/ros/noetic        

# Set upp workspace
RUN mkdir -p /ws/src   

# Set noninteractive installation
ENV DEBIAN_FRONTEND=noninteractive

# Package apt dependencies
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
        avahi-daemon \
        iproute2 \
        iputils-ping \
        nano \
        git \
        python3-catkin-tools \
        net-tools \
        build-essential \
        cmake \ 
        libglfw3-dev \
        libglew-dev \
        libeigen3-dev \
        libjsoncpp-dev \
        libtclap-dev \
        libspdlog-dev \
        libcurl4-openssl-dev \
        ros-noetic-pcl-ros \
        ros-noetic-rviz \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ws
