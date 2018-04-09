## インストールガイド
＜ubuntu＞      
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/

## Install MongoDB Community Edition
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
### Import the public key used by the package management system.
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5
```

### Create a list file for MongoDB.
Ubuntu 14.04
```
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
```
Ubuntu 16.04
```
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.6.list
```

### Reload local package database.
```
sudo apt-get update
```
### Install the MongoDB packages.
```
sudo apt-get install -y mongodb-org
```
（ex. Install a specific release of MongoDB）    
```
sudo apt-get install -y mongodb-org=3.6.3 mongodb-org-server=3.6.3 mongodb-org-shell=3.6.3 mongodb-org-mongos=3.6.3 mongodb-org-tools=3.6.3

＜Pin a specific version of MongoDB＞
echo "mongodb-org hold" | sudo dpkg --set-selections
echo "mongodb-org-server hold" | sudo dpkg --set-selections
echo "mongodb-org-shell hold" | sudo dpkg --set-selections
echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
echo "mongodb-org-tools hold" | sudo dpkg --set-selections
```

