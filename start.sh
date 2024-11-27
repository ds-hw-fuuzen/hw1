#!/bin/bash

if [ -d /root/.ssh ]; then
    chmod 600 /root/.ssh/*
fi

tail -f /dev/null