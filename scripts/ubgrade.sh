#!/bin/bash

set -e
sudo apt -yq clean
sudo apt -yqU --auto-remove upgrade
