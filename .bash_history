ls
nano setup_pgadmin.sh
chmod +x setup_pgadmin.sh
./setup_pgadmin.sh
nano setup_depend.sh
chmod +x setup_depend.sh
./setup_depend.sh
sudo apt update && sudo apt upgrade -y
nano configuration.nix
./setup_depend.sh
command -v apt dnf pacman yum zypper
sudo apt update && sudo apt upgrade -y
apt-cache search python3. | grep 3.11
python --version
python3 --version
sudo systemctl stop apache2
sudo systemctl stop pgadmin4
sudo systemctl stop apache2
sudo systemctl stop pgadmin4
sudo apt remove --purge pgadmin4 pgadmin4-desktop -y
sudo apt autoremove -y
sudo apt clean
sudo rm -rf /var/lib/pgadmin4
sudo rm -rf /etc/pgadmin
sudo rm -rf ~/.pgadmin
sudo rm -rf /var/lib/pgadmin4
realpath pgadmin4
sudo rm -rf /home/mani/pgadmin4
realpath pgadmin4
sudo rm -rf /home/mani/pgadmin4
sudo rm -rf ~/.pgadmin
sudo rm -rf /var/lib/dpkg/info/pgadmin4*
sudo rm -rf /var/lib/dpkg/info/pgadmin4*
sudo apt update --fix-missing
sudo apt install -f
sudo dpkg --configure -a
dpkg -l | grep pgadmin
systemctl list-units --type=service | grep pgadmin
\sudo systemctl stop apache2
sudo systemctl stop pgadmin4
ps aux | grep pgadmin
sudo kill -9 4616 11505 11604 11605 11675 11691 11730 11777
ps aux | grep pgadmin
nano setup_depend.sh
chmod +x setup_depend.sh
./setup_depend.sh
./setup_depend.sh
nano setup_depend.sh
nano setup_postgres.sh
nano setup_postgres.sh
./setup_postgres.sh
/snap/pgadmin4/16/meta/snap.yaml
mount | grep snap
sudo systemctl restart snapd
sudo snap refresh
ls
ls
./setup.sh
./setup_depend.sh
./setup_postgres.sh
snap version
sudo apt update && sudo apt install --reinstall snapd
snap version
sudo systemctl restart snapd
sudo umount /snap/pgadmin4/16
sudo systemctl restart snapd
sudo umount /snap/pgadmin4/16
systemctl is-active snapd
ls /snap/pgadmin4/
sudo snap install pgadmin4
snap help refresh
pgadmin4
nano setup_postgres.sh
chmod _x setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
sudo dpkg --configure -a
sudo apt-get install -f
sudo apt-get install -y pgadmin4-desktop
sudo apt-get install -y pgadmin4
sudo apt-get remove --purge pgadmin4 pgadmin4-desktop
sudo apt-get autoremove -y
sudo apt-get autoclean
sudo apt-get remove --purge pgadmin4 pgadmin4-desktop
sudo apt-get autoremove -y
sudo apt-get autoclean
sudo apt update
sudo apt install -y pgadmin4
sudo apt install -f
nano setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
nano setup_pgadmin.sh
chmod +x setup_pgadmin.sh
./setup_pgadmin.sh
nano setup_pgadmin.sh
chmod +x setup_pgadmin.sh
./setup_pgadmin.sh
pgadmin4
pgadmin4
snap list
sudo snap remove pgadmin4 --purge
systemctl status snapd
snap list
sudo snap install pgadmin4
pgrep -laf pgadmin
sudo systemctl status postgresql
sudo snap remove pgadmin4
sudo rm -rf /var/lib/snapd/snaps/pgadmin4_*
sudo rm -rf ~/snap/pgadmin4
# Add the pgAdmin repository key
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
# Add the repository
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list'
# Update package list
sudo apt update
# Install both Desktop and Web versions
sudo apt install -y pgadmin4
pgadmin4
./setup_pgadmin.sh
pgadmin4 --debug
sudo apt install
sudo apt update
sudo snap update
sudo snap 
ls
./setup_postgres.sh
nano setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
sudo-i -u postgres
sudo -i -u postgres
sudo -u postgres psql -d apicloud -c "\dn"   # Check schemas
sudo -u postgres psql -d apicloud -c "\dt"   # Check tables
pgadmin4
./setup_postgres.sh
ls -ld ~/snap/pgadmin4/16/.config/ibus/bus
ls -ld ~/snap/pgadmin4/16/.config/ibus/bus
nano setup_postgres.sh
nano setup_postgres.sh
rm ~/snap/pgadmin4/16/.config/ibus/bus
mkdir -p ~/snap/pgadmin4/16/.config/ibus/bus
sudo chown -R $USER:$USER ~/snap/pgadmin4
./setup_postgres.sh
pgadmin4
ls
nano setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
nano setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
find / -type f -name "servers.json" 2>/dev/null
nano setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
nano setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
nano setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
pgadmin4
sudo ./setup.sh
sudo ./setup_postgres.sh
nano setup_postgres.sh
chmod +x setup_postgres.sh
sudo ./setup_postgres.sh
./setup_postgres.sh
psql --version
sudo -i -u postgres
./setup_postgres.sh
sudo systemctl restart snapd
sudo systemctl status snapd
nano setup_postgres.sh
chmod +x  setup_postgres.sh
./setup_postgres.sh
nano setup_postgres.sh
chmod +x  setup_postgres.sh
./setup_postgres.sh
sudo systemctl enable --now snapd
sudo systemctl enable --now snapd
shutdown /r /t 0
wsl --shutdown
wsl --shutdown
sudo apt install wsl
wsl --shutdown
wsl
wsl --terminate ubuntu
xclean
wsl xclean
wsl -l -v
Restart-Service LxssManager
shutdown /r /t 0
ls
./setup_postgres.sh./setup_postgres.sh
./setup_postgres.sh
nano setup_postgres.sh
chmod +x setup_postgres.shposdwxw
./setup_postgres.sh
nano setup_postgres.sh
sudo -i -u postgres
nano setup_postgres.sh
nano setup_postgres.sh
./setup_postgres.sh
ls
nano setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
./setup_postgres.sh
./setup_postgres.sh
nano setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
systemctl list-units --type=service | grep postgres
systemctl list-units --type=service | grep postgres
ps aux | grep postgres
pg_lsclusters
service --status-all | grep postgres
pg_ctl status
sudo nano /etc/postgresql/16/main/postgresql.conf
sudo nano /etc/postgresql/16/main/pg_hba.conf
sudo systemctl restart postgresql
ip a | grep eth0
sudo systemctl status postgresql
pgadmin4
ip a | grep eth0
./setup_postgres.sh
ls
nano CmsPage.sh
nano ApiStudio.sh
nano CmsPage.sh
cd API-STUDIO
ls
cd ApiStudio
ls
cdcd
cd
ls
realpath ApiStudio
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
cd API-STUDIO
ls
cd ApiStudio
ls
nano requirements.txt
nano ApiStudio.sh
cd
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
sudo dpkg --configure -a
sudo apt install -f
sudo apt install apparmor
sudo systemctl enable apparmor
sudo systemctl restart apparmor
sudo apt install --reinstall pgadmin4
sudo apt install --reinstall pgadmin
sudo apt install --reinstall pgadmin4
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
ls
Crudapp.sh
./Crudapp.sh
nano Crudapp.sh
chmod  Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
nano Sqlviews.sh
chmod +x Sqlviews.sh
ls
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
ls
cd API-STUDIO
ls
cd ApiStudio
ls
nano ApiStudio.sh
cd ApiStudiocd ApiStudio
cd ApiStudio
ls
cd
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
sudo apt update
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano apistudio
nano ApiStudio.sh
ls
nano setup_postgres
nano setup_postgres.sh
nano setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
nano setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
nano setup_postgres.sh
