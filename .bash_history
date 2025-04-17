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
ls
git status
git add .
git commit -a
git remote -v
git push -u origin main
git remote remove origin
ssh-keygen -t rsa -b 4096 -C "manikandanperumal00@gmail.com"
cat ~/.ssh/id_rsa.pub
git remote -v
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
git remote add origin git@github.com:Manikandan78/nix_project.git
ssh -T git@github.com
git stats
git status
git add .
git commit push
git commit -m "last update"
git push origin main
.ssh/id_rsa
git rm --cached .ssh/id_rsa
rm -f .ssh/id_rsa
.ssh/id_rsa
git remote -v
cd /path/to/your/repo  # Change this to your actual repo path
cd /path/to/your/repo  # Change this to your actual repo pathgit rm --cached .ssh/id_rsa
cd /path/to/your/repo  # Change this to your actual repo pathgit rm --cached .ssh/id_rsa
git rm --cached .ssh/id_rsa
git ls-files | grep "id_rsa"
git ls-files | grep "id_rsa.pub"
git rm --cached .ssh/id_rsa.pub
ssh-keygen -t rsa -b 4096 -C "manikandanperumal00@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/gitkey
ssh-add ~/.ssh/id_rsa
ssh-add ~/.ssh/id_rsa/gitkey
ssh-add ~/gitkey
cat ~/gitkey.pub
ssh -T git@github.com
git remote set-url origin git@github.com:Manikandan78/apistudio.git 
git remote -v
git add .
git commit -m "updated code for nix"
git push origin main
git show fec81b1279f62273d31c1cbef83fddd1635e05da
git rm --cached .ssh/id_rsa
git log --stat | grep id_rsa
git log --stat | grep id_rsa
pip install git-filter-repo
git push origin --force --all
echo ".ssh/id_rsa" >> .gitignore
git add .gitignore
git commit -m "Add id_rsa to gitignore"
git push origin main  # or your branch name
rm -f .ssh/id_rsa
git rm --cached .ssh/id_rsa
git commit -m "Remove private key from repository"
git push origin main  # Change 'main' to your branch name
pip install git-filter-repo
python3 -m venv myenv
source myenv/bin/activate  # Activate the virtual environment
pip install git-filter-repo  # Now install inside the virtual environment
sudo apt install pipx  # Install pipx if not already installed
pipx install git-filter-repo
pip install --break-system-packages git-filter-repo
git rm --cached .ssh/id_rsa
rm .ssh/id_rsa  # Deletes the file from your local system
rm .ssh/id_rsa.pub  # Deletes the file from your local system
rm .ssh/id_rsa.pub  # Deletes the file from your local system
rm .ssh/id_rsa  # Deletes the file from your local system
git commit -m "Remove private key from repository"
git push origin main  # or the branch you're working on
git filter-repo --path .ssh/id_rsa --invert-paths
git push origin --force --all
.ssh/id_rsa
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
ssh-keygen -t rsa -b 4096 -C "manikandanperumal00@gmail.com"
git push origin --force --all
# Install BFG if not already installed
sudo apt install bfg-repo-cleaner
# Clone a fresh copy of your repository
git clone --mirror git@github.com:Manikandan78/apistudio.git
cd apistudio.git
# Remove the private key from history
bfg --delete-files .ssh/id_rsa
# Cleanup and force push the changes
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git push origin --force --all
git config --global user.name "mani123653"
git config --global user.email "t978732372gmail.com"
git init
git add .
git commit -m "Initial commit"
ssh-keygen -t ed25519 -C "t97873237@gmail.com"
git status
ls
cat ~/.ssh/id_ed25519.pub
ssh -T git@github.com
git remote add origin git@github.com:mani123653/apistudio.git
git remote add origin https://github.com/mani123653/apistudio.git
git branch -M main
git push -u origin main
git remote add origin git@github.com:mani123653/Apistudio_project.git
git remote -v
git remote remove origin
git remote -v
git remote add origin git@github.com:mani123653/Apistudio_project.git
git remote -v
git branch -M main
git push -u origin main
git push -u origin main
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ls
./setup.sh
./setup_depend.sh
./setup_postgres.sh
pgadmin4 --trace-warnings ...
ls -l /home/mani/snap/pgadmin4/16/.config/ibus
rm /home/mani/snap/pgadmin4/16/.config/ibus/bus
mkdir -p /home/mani/snap/pgadmin4/16/.config/ibus/bus
ibus restart
pgadmin4
sudo apt install ibus
mkdir -p /home/mani/snap/pgadmin4/16/.config/ibus/bus
ls
./ApiStudio.sh
sudo -u postgres psql
sudo systemctl status postgresql
sudo nano /etc/postgresql/15/main/pg_hba.conf  # Path may vary depending on your version
sudo nano /etc/postgresql/16/main/pg_hba.conf  # Path may vary depending on your version
sudo nano /etc/postgresql/16/main/pg_hba.conf  # Path may vary depending on your version
sudo systemctl restart postgresql
sudo systemctl status postgresql
python manage.py runserver
./ApiStudio.sh
./ApiStudio.sh
nano
nano ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
nano ApiStudio.sh
nano ApiStudio.sh
chmod +x Apistudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
chmod +x Apistudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
sudo systemctl status nginx
sudo netstat -tulnp | grep 8005  # Check if Django is running on port 8005
nano Postapi.sh
nano PostApi.sh
chmod +x PostApi.sh
./PostApi.sh
sudo apt --fix-broken install
sudo dpkg --configure -a
sudo apt remove --purge pgadmin4 pgadmin4-desktop
sudo apt update
sudo apt install pgadmin4
sudo aa-status
sudo systemctl stop apparmor
df -h
mount
sudo apt install pgadmin4 --subdomainfs
nano PostApi.sh
./PostApi.sh
ls
./setup.sh
./setup_depend.sh
./setup_postgres.sh
./ApiStudio.sh
ls
nano flake.nix
./ApiStudio.sh
./setup_depend.sh
./setup_postgres.sh
./ApiStudio.sh
./ApiStudio.sh
./setup_depend.sh
./setup_postgres.sh
./ApiStudio.sh
python manage.py migrate
python manage.py migrate
python3 manage.py migrate
nano setup_apistudio_nginx.sh
~/.config/starship.toml
nano ~/.config/starship.toml
realpath starship.toml
nano /home/mani/starship.toml
realpath ~/.config/starship.toml
nano /home/mani/.config/starship.toml
mkdir -p ~/.config
nano ~/.config/starship.toml
exec zsh
ls
nano setup_nginx.sh
nano setup_apistudio_nginx.sh
./setup_apistudio_nginx.sh
nano setup_apistudio_nginx.sh
chmod +x setup_apistudio_nginx.sh
./setup_apistudio_nginx.sh
cd /home/API-STUDIO/apistudio
ls
cd API-STUDIO
ls
cd ApiStudio
ls
realpath

cd
./setup_apistudio_nginx.sh
nano setup_apistudio_nginx.sh
chmod +x setup_apistudio_nginx.sh
./setup_apistudio_nginx.sh
nano setup_apistudio_nginx.sh
chmod +x setup_apistudio_nginx.sh
./setup_apistudio_nginx.sh
nano setup_apistudio_nginx.sh
./setup_apistudio_nginx.sh
chmod +x setup_apistudio_nginx.sh
./setup_apistudio_nginx.sh
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ls
etc
cd etc
cd
ls
sudo nano /etc/nginx/mime.types
sudo nano /etc/nginx/nginx.conf
nano flake.nix
nano modules/nginx.nix
nano nginx.nix
nano flake.nix
nano microapi.conf
nano flake.nix
nano flake.nix
sudo nixos-rebuild switch --flake .
nano crudapp.service
nano /etc/systemd/system
systemctl status crudapp.service
nano crudapp.service
sudo nano /etc/systemd/system/crudapp.service
nano /etc/systemd/system
sudo nano /etc/systemd/system
ls
cd API-STUDIO
ls
cd CrudApp
ls
realpath bin
realpath python
sudo nano /etc/systemd/system/crudapp.service
systemctl status crudapp.service
sudo nano /etc/systemd/system/crudapp.service
systemctl status crudapp.service
sudo nano /etc/systemd/system/crudapp.service
systemctl status crudapp.service
nano run_app.sh
ExecStart=/home/mani/CrudApp.sh
nano run_app.sh
ExecStart=/home/mani/Crudapp.sh
chmod /home/mani/Crudapp.sh
chmod +x /home/mani/Crudapp.sh
chmod +x run_app.sh
cd
chmod +x run_app.sh
nano run_app.sh
cd /API-STUDIO/CrudApp
cd API-STUDIO/CrudApp
ls
nano run_app.sh
cd
nano run_app.sh
chmod +x run_app.sh
./run_app.sh
ls
nano run_app.sh
chmod +x run_app.sh
./run_app.sh
pip install python-magic
sudo apt install python3
nano Crudapp.sh
./Crudapp.sh
./run_app.sh
systemctl status crudapp.service
sudo systemctl start crudapp.service
sudo systemctl enable crudapp.service
journalctl -u crudapp.service -e
sudo nano /etc/systemd/system/crudapp.service
sudo systemctl start crudapp.service
systemctl daemon-reload
systemctl status crudapp.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart crudapp.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart crudapp.service
systemctl status crudapp.service
ls
nano microapi.conf
systemctl status crudapp.service
./run_app.sh
nano run_app.sh
chmod run_app.sh
chmod +x run_app.sh
./run_app.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
systemctl status crudapp.service
nano run_app.sh
chmod run_app.sh
chmod +x run_app.sh
./run_app.sh
systemctl status crudapp.service
nano crudapp.service
nano microapi.conf
nano /etc/systemd/system/apistudio.service
nano Apistudio.sh
ls
nano ApiStudio.sh
./ApiStudio.sh\
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nginx -v
sudo systemctl status nginx
cd /home/mani/API-STUDIO/ApiStudio
source venv/bin/activate
gunicorn apistydio.wsgi:application --bind 127.0.0.1:8050
cd
ls
nano setup_nginx.sh
flake.nix
nano flake.nix
chmod +x flake.nix
./flake.nix
./setup.sh
./setup_depend.sh
ls
nano setup_nginx.sh
chmod +x setup_nginx.sh
/run/apistudio.sock
/run/a\ApiStudio.sock
/run/ApiStudio.sock
sudo /run/ApiStudio.sock
systemctl status gunicorn-apistudio
journalctl -u gunicorn-apistudio -e
/etc/nginx/sites-available/apistudio
sudo /etc/nginx/sites-available/apistudio
nano /etc/nginx/sites-available/apistudio
ls /etc/nginx/sites-available
ls /etc/nginx/sites-enabled
sudo nginx -t
nano v
nano /run/apistudio.sock
nano /etc/systemd/system/gunicorn-apistudio.service
nano nginx.config
flake.nix
nano flake.nix
sudo nginx -t
sudo systemctl restart nginx
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d studio.colleges91.com
sudo nginx -t
sudo systemctl reload nginx
nano flake.nix
mkdir services
cd services
nano gunicorn.service
nano nginx.config
nano nginx
cd 
mkdir nginx
cd nginx
nginx.config
nano nginx.config
ls
cd
nano flake.nix
nano configuration.nix
sudo nixos-rebuild switch --flake .#server
nix run home-manager/master -- init --switch
ls
nano setup_nginx.sh
./setup_nginx.sh
gunicorn 
gunicorn  --version
sudo apt install gunicorn
gunicorn  --version
nano setup_nginx.sh
chmod +x setup_nginx.sh
./setup_nginx.sh
ls
nano setup_nginx.sh
./setup_nginx.sh
nano setup_nginx.sh
sudo systemctl list-timers | grep certbot
 ls
nano setup_nginx.sh
sudo systemctl list-timers | grep certbot


sudo chmod +x /etc/letsencrypt/renewal-hooks/post/nginx-reload.sh
sudo nano /usr/local/bin/nginx-auto-recover.sh
sudo chmod +x /usr/local/bin/nginx-auto-recover.sh
sudo /usr/local/bin/nginx-auto-recover.sh
nano sudo /usr/local/bin/nginx-auto-recover.sh
nano sudo /usr/local/bin/nginx-auto-recover.sh
sudo chmod +x /usr/local/bin/nginx-auto-recover.sh
sudo chown root:root /usr/local/bin/nginx-auto-recover.sh
sudo crontab -e
reboot
restart
clear
ls
cd API-STUDIO
ls
cd ApiStudio
ls
ls
ls
ls
clear
ls
nano setup_nginx.sh
./setup_nginx.sh
nano setup_nginx.sh
nano flake.nix
sudo systemctl start certbot-renew
nano flake.nix
sudo nixos-rebuild switch
sudo systemctl start certbot-renew.service
 nixos-rebuild switch
home-manager switch --flake .#
nano home.nix
home-manager switch --flake .#mani
~/bin/certbot-renew.sh
ls
                                                                                                                                                                                                                                                                                                                                                                                                                         ls
~/bin/certbot-renew.sh
./certbot.sh
touch certbot-nginx-gunicorn.nix
nano certbot-nginx-gunicorn.nix
nano certbot-nginx-gunicorn.nix
nano flake.nix
nano flake.nix
sudo nixos-rebuild switch --flake .#
nix develop
nano certbot-nginx-gunicorn.nix
sudo nixos-rebuild switch --flake .#
nix develop
sudo systemctl restart certbot-init
/etc/letsencrypt/
ls /etc/letsencrypt/live/studio.colleges91.com/
ls /etc/letsencrypt/live/studio.colleges91.com
ls \etc\letsencrypt\live\studio.colleges91.com
ls /etc/letsencrypt/live/studio.colleges91.com/
tree .
# or
ls certbot-nginx-gunicorn.nix flake.nix
tree 
sudo install tree
sudo snapinstall tree
sudo snap install tree
ls certbot-nginx-gunicorn.nix flake.nix
tree 
ls -1
sudo -i
ls
certbot-nginx-gunicorn.nix
nano certbot-nginx-gunicorn.nix
ls
mkdir nginx
cd nginx
ls
nginx.config
nano nginx.config
sudo mkdir -p /var/www/studio
ls
sudo mkdir -p /var/www/studio
nano nginx.config
nix develop
ls
cd
cd
cd home
exit
