#!/bin/sh

source .env

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>> building package..."
make clean
make package install