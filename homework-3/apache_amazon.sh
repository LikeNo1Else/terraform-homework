#!/bin/bash

sudo hostname apache-httpd
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd