#!/usr/bin/env bash

echo "GTK_IM_MODULE=cedilla" >> /etc/environment
echo "QT_IM_MODULE=cedilla" >> /etc/environment

echo "export GTK_IM_MODULE=cedilla" >> /etc/profile
echo "export QT_IM_MODULE=cedilla" >> /etc/profile
