## pgAdmin
https://www.pgadmin.org/    
https://wiki.postgresql.org/wiki/Apt
　  
＜参考サイト＞    
http://www.system-act.com/develop/windows/pgadmin.html    

（デスクトップモードってのもある？）    
https://medium.com/@philip.mutua/postgresql-install-pgadmin-4-desktop-mode-in-ubuntu-16-04-6faca19f0cfe




deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list

sudo apt-get install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install postgresql-9.6 pgadmin3


## pgAdmin：Windows
http://db-study.com/archives/133

## webから
＜phpPgAdmin＞    
https://sourceforge.net/projects/phppgadmin/


## いくつか
https://sugimotonote.com/2017/11/02/postgresql-gui-select/


## EMS PostgreSQL Manager 3 Lite」で
http://d.hatena.ne.jp/obys/20061125/1164464900
https://www.sqlmanager.net/en/products/postgresql/manager/download




