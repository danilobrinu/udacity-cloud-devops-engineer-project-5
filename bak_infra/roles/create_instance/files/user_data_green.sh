#!/bin/bash
sudo apt update -y && sudo apt install nginx -y

echo '<p style="color:blue">green.</p>' > /var/www/html/index.html

sudo systemctl enable nginx
sudo systemctl start nginx