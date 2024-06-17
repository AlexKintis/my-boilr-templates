#!/bin/bash

# Name of the docker image
IMAGE_NAME="{{CommandName}}"

# Get the directory of the script
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Command to build the docker image
BUILD_COMMAND="docker build -t $IMAGE_NAME -f $SCRIPT_DIR/{{DockerfileName}} ."

# Base command to run the docker container
BASE_RUN_COMMAND="{{BaseRunCommand}} $IMAGE_NAME"

# Check if the image exists
if [[ "$(docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; then
  echo "Image does not exist. Building the image..."
  eval $BUILD_COMMAND
else
  echo "Image exists. Skipping build..."
fi

# Append all arguments provided to the script to the run command
RUN_COMMAND="$BASE_RUN_COMMAND $@"

# Run the docker container with the provided arguments
eval $RUN_COMMAND
