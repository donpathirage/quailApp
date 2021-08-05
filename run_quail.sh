#!/bin/bash

sudo docker run --gpus=all -v $(pwd)/data:/home/appuser/detectron2_repo/data donpathirage/quaildetector:1.0

