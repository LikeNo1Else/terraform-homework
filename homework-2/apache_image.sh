#!/bin/bash

sudo hostname apache
sudo update -y
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
sudo bash -c 'echo "Hello, World!" > /var/www/html/index.html'
sudo systemctl restart apache2

