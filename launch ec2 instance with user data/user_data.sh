#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2 

cd /var/www/html
rm index.html
git clone "<your_github_clone_url>" .

sudo systemctl restart apache2


