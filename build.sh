#!/bin/bash

PLUGIN_NAME="ping-checker-rules"
PING_CHECKER="../../ping-checker/scripting/include"

cd scripting
spcomp $PLUGIN_NAME.sp -i $PING_CHECKER -o ../plugins/$PLUGIN_NAME.smx
