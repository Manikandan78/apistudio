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
nano flake.nix
nix develop
nano flake.nix
nix develop
git remote -v
git add .
git commit -m "WIP: Update flake.nix"
nix develop
nano flake.nix
nix develop
nano flake.nix
git add . && git commit -m "Clean state"
nix develop
nix search nixpkgs certbot
certbot
certbot -v
nix search nixpkgs certbot-nginx
nix eval nixpkgs.legacyPackages.x86_64-linux.certbot-nginx.name
nix flake update
git add .
git commit -m "Clean state"
ls
nano setup.sh
namo setup_nginx.sh
nano setup_nginx.sh
chmod +x setup_nginx.sh
./setup_nginx.sh
nano setup_nginx.sh
chmod +x setup_nginx.sh
./setup_nginx.sh
nano /etc/systemd/system/apistudio.service
sudo nano /etc/systemd/system/apistudio.service
sudo nano /etc/systemd/system/apistudio.service
nano setup_django_env.sh
chmod +x setup_django_env.sh
./setup_django_env.sh
nano setup_django_env.sh
chmod +x setup_django_env.sh
./setup_django_env.sh
nano setup_django_env.sh
chmod +x setup_django_env.sh
./setup_django_env.sh
nano setup_nginx_certbot.sh
chmod +x setup_nginx_certbot.sh
./setup_nginx_certbot.sh
./setup_nginx_certbot.sh
nano setup_nginx_certbot.sh
chmod +x setup_nginx_certbot.sh
./setup_nginx_certbot.sh
nano setup_nginx_certbot.sh
nano setup_nginx_certbot.sh
chmod +x setup_nginx_certbot.sh
./setup_nginx_certbot.sh
nano /var/log/letsencrypt/letsencrypt.log
sudo nano /var/log/letsencrypt/letsencrypt.log
sudo lsof -i :80
sudo netstat -tulnp | grep :80
sudo pkill nginx
sudo nginx
sudo ls /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/default
sudo ls /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx
sudo certbot --nginx -d studio.colleges91.com --redirect --agree-tos --email admin@colleges91.com
sudo nginx
sudo systemctl stop nginx
sudo certbot certonly --standalone -d studio.colleges91.com --agree-tos --email admin@colleges91.com
sudo systemctl start nginx
sudo systemctl stop nginx
sudo pkill nginx
sudo lsof -i :80
sudo systemctl start nginx
sudo nginx -t && sudo nginx
ls /etc/nginx/sites-enabled/
sudo lsof -i :80
sudo systemctl stop nginx
sudo pkill nginx
sudo systemctl stop apache2
sudo systemctl disable apache2
sudo systemctl start nginx
sudo rm /etc/nginx/sites-enabled/default
sudo certbot --nginx -d studio.colleges91.com
sudo lsof -i :80
sudo systemctl stop nginx
sudo pkill nginx
sudo systemctl stop nginx
sudo lsof -i :80
sudo nginx -t
sudo systemctl start nginx
sudo certbot --nginx -d studio.colleges91.com
certbot -v
sudo certbot --nginx -d studio.colleges91.com
certbot --nginx -d studio.colleges91.com   --config-dir ~/certbot/config   --work-dir ~/certbot/work   --logs-dir ~/certbot/logs
sudo systemctl status apistudio
curl http://127.0.0.1:8005
journalctl -u apistudio.service -xe
sudo nginx -t
sudo systemctl restart nginx
sudo lsof -i :80
sudo systemctl stop apache2
sudo lsof -i :80
sudo systemctl stop nginx
sudo lsof -i :80
ping studio.colleges91.com
sudo certbot certificates
sudo certbot renew --dry-run
sudo rm -rf /var/log/letsencrypt/.certbot.lock
chmod +x setup_nginx_certbot.sh
sudo ./setup_nginx_certbot.sh
ls
./setup_nginx.sh
sudo ./setup_nginx_certbot.sh
nano ./setup_nginx_certbot.sh
nano ./setup_certbot.sh
nano setup_certbot.sh
chmod +x setup_certbot.sh
./setup_certbot.sh
sudo nano /etc/nginx/sites-available/apistudio.service
sudo nano /etc/nginx/sites-available/apistudio.service
sudo ln -s /etc/nginx/sites-available/studio.colleges91.com /etc/nginx/sites-enabled/
sudo nano /etc/nginx/sites-available/studio.colleges91.com
nano nginx_certbot_retry.sh
chmod +x nginx_certbot_retry.sh
./nano setup_certbot.sh
./setup_certbot.sh
./nginx_certbot_retry.sh
chmod +x /path/to/nginx_certbot.sh
chmod +x /path/to/nginx_certbot_retry.sh
ls
rm  nginx_certbot_retry.sh
ls
rm setup_certbot.sh
ls
rm sudo
rm snap certbot
rm  certbot
cd certbot
ls
nano setup_nginx_certbot.sh
cd
nano setup_nginx_certbot.sh
./setup_nginx_certbot.sh
ls /etc/nginx/sites-available/
ls /etc/nginx/sites-enabled/
include /etc/nginx/sites-enabled/*;
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl enable apistudio.service
sudo systemctl start apistudio.service
sudo systemctl status apistudio.service
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl start apistudio.service
sudo systemctl status apistudio.service
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl start apistudio.service
sudo systemctl status apistudio.service
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl daemon-reload
sudo systemctl enable apistudio.service
sudo systemctl start apistudio.service
sudo systemctl status apistudio.service
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl daemon-reload
sudo systemctl enable apistudio.service
sudo systemctl start apistudio.service
sudo systemctl status apistudio.service
python manage.py collectstatic
python3 manage.py collectstatic
python3 manage.py collectstatic
cd API-STUDIO
cd ApiStudio
python3 manage.py collectstatic
cd
ls
./setup_nginx.sh
./setup_django_env.sh
killall gunicorn
killall gunicorn
./setup_django_env.sh
./setup_nginx_certbot.sh
sudo certbot certificates
./setup_nginx_certbot.sh
server {
    listen 80;
    server_name _;  # Accepts any IP or hostname
    location / {
        proxy_pass http://127.0.0.1:8000;  # Replace with your backend API port
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}
ls
sudo nano etc/nginx/sites-available
sudo nano /etc/nginx/sites-available
sudo nano /etc/nginx/sites-available/
cd /etc/nginx/sites-available/
ls
rm ApiStudio
rm ApiStudio
ls
nano ApiSutdio
sudo nano ApiSutdio
sudo nano apisutdio
ls -l /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/apistudio
ls -l /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/ApiStudio
ls
ls -l /etc/nginx/sites-enabled/
cd
ls -l /etc/nginx/sites-enabled/
sudo nginx -t
sudo ls -l /etc/nginx/sites-enabled
sudo rm /etc/nginx/sites-enabled/studio.colleges91.com
sudo nginx -t
sudo systemctl reload nginx
include /etc/nginx/sites-enabled/studio.colleges91.com;
sudo nginx -t
include /etc/nginx/apistudiosudo nano /etc/systemd/system/gunicorn.service
sudo nano /etc/systemd/system/gunicorn.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn
sudo systemctl enable gunicorn
sudo nano /etc/nginx/sites-available/myproject
sudo ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
http://127.0.0.1.8005
sudo nano /etc/nginx/sites-available/myproject
sudo nginx -t
sudo systemctl reload nginx
ls
nano setup_nginx.sh
nano sdetup_apistudio.sh
nano setup_apistudio.sh
chmod +x setup_apistudio.sh
./setup_apistudio.sh
nano setup_apistudio.sh
chmod +x setup_apistudio.sh
./setup_apistudio.sh
sudo systemctl status gunicorn_apistudio
/home/mani/ApiStudio/venv/bin/gunicorn --version
source ~/ApiStudio/venv/bin/activate
pip install gunicorn
deactivate
source ~/API-STUDIO/ApiStudio/venv/bin/activate
pip install gunicorn
deactivate
ls ~/API-STUDIO/ApiStudio
nano setup_apistudio.sh
chmod +x setup_apistudio.sh
.ls
I would like to request half-day permission on [Date] as I need to leave by 1:00 PM to travel to my native place due to personal reasons.
./apistudio_all.sh
ls
nano run_app.sh
./run_app.sh
                                                                                                                                                                    ls
nano Cmspage.sh
nano CmsPage.sh
nano Cmspage.sh
chmod +x Cmspage.sh
./Cmspage.sh
nano Cmspage.sh
chmod +x Cmspage.sh
./Cmspage.sh
./start_uvicorn.sh
nano Cmspage.sh
chmod +x Cmspage.sh
./Cmspage.sh
ls
nano Cmspage.sh
./Cmspage.sh
nano Cmspage.sh
nano CoreApi.sh
nano CoreApi.sh
chmod 
chmod +x CoreApi.sh
./CoreApi.sh
nano CoreApi.sh
chmod +x CoreApi.sh
./CoreApi.sh
nano CoreApi.sh
chmod +x CoreApi.sh
./CoreApi.sh
nano CoreApi.sh
chmod +x CoreApi.sh
./CoreApi.sh
ls
cd API-STUDIO
ls
cd CoreApi
ls
nano main.py
cd
./CoreApi.sh
nano CoreApi.sh
chmod +x CoreApi.sh
./CoreApi.sh
nano CoreApi.sh
chmod +x CoreApi.sh
./CoreApi.sh
nano CoreApi.sh
nano CoreApi.sh
chmod +x CoreApi.sh
./CoreApi.sh
nano CoreApi.sh
chmod +x CoreApi.sh
./CoreApi.sh
nano CoreApi.sh
chmod +x CoreApi.sh
./CoreApi.sh
sudo nginx -t && sudo systemctl reload nginx
./CoreApi.sh
./CoreApi.sh
ls
./setup_pgadmin.sh
./setup_postgres.sh
ls
sudo nano /etc/nginx/conf.d/microapi.conf
nano setup_nginx_config.sh
chmod +x setup_nginx_config.sh
./setup_nginx_config.sh
nano setup_nginx_config.sh
chmod +x setup_nginx_config.sh
./setup_nginx_config.sh
nano setup_nginx_config.sh
chmod +x setup_nginx_config.sh
./setup_nginx_config.sh
nginx status
sudo systemctl status nginx
sudo lsof -i -P -n | grep LISTEN | grep nginx
curl -I http://localhost
curl -I https://api.colleges91.com
ls
./ApiStudio.sh
nano ApiStudio.sh
chmod +x  ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x  ApiStudio.sh
./ApiStudio.sh
lsof -i :8005
lsof -i :8005
lsof -i :8005
python manage.py migrate
python3 manage.py migrate
nano ApiStudio.sh
lsof -i :8005
ls
./apistudio.sh
./ApiStudio_all.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x  ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
./setup_postgres.sh
./setup./
nano setup_pgadmin.sh
./ApiStudio.sh
python manage.py dbshell
python3 manage.py dbshell
cd API-STUDIO
cd ApiStudio
python3 manage.py dbshell
pip install psycopg2-binary
pip install psycopg2-binary
source .venv/bin/activate
ls
pip install psycopg2-binary
python3 -m venv .venv
pip install psycopg2-binary
cd venv
pip install psycopg2-binary
python3 -m venv .venv
pip install psycopg2-binary
nano ApiStudio.sh
cd

nano setup_postgres.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
sudo -u postgres psql
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
sudo apt update
sudo apt install python3 python3-venv python3-pip postgresql libpq-dev -y
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano setup_postgres.sh
nano ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
sudo lsof -i :8005
sudo kill -9 3796
sudo lsof -i :8005
./ApiStudio.sh
sudo lsof -i :8005
sudo kill -9 5978
sudo lsof -i :8005
sudo kill -9 6231
sudo lsof -i :8005
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
sudo -u postgres psql
./ApiStudio.sh
sudo -u postgres psqlsudo systemctl reload postgresql
sudo systemctl reload postgresql
sudo systemctl restart postgresql
psql -h localhost -U microapi -d apicloud
sudo tail -f /var/log/postgresql/postgresql-{version}-main.log
sudo tail -f /var/log/postgresql/postgresql17-main.log
sudo tail -f /var/log/postgresql/postgresql16-main.log
sudo tail -f /var/log/postgresql/postgresql15-main.log
sudo -u postgres psql
\l  # List all databases
sudo systemctl restart postgresql
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano setup_postgres.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
ls
nano ApiStudio.sh
./ApiStudio.sh
nano setup_postgres.sh
sudo -u postgres psql
\password microapi
\password microapi
sudo nano /etc/postgresql/16/main/pg_hba.conf
sudo systemctl reload postgresql
sudo systemctl restart postgresql
psql -h localhost -U microapi -d apicloud
sudo tail -f /var/log/postgresql/postgresql-{version}-main.log
sudo tail -f /var/log/postgresql/postgresql-16-main.log
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
nano setup_postgres.sh
./setup_postgres.sh
nano setup_postgres.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
pip install --upgrade pip
pip install -r "$PROJECT_DIR/requirements.txt" || pip install psycopg2-binary
pip install --upgrade pip
pip install --upgrade pip
pip install --upgrade pip
pip install -r "$PROJECT_DIR/requirements.txt" || pip install psycopg2-binary
pip install sqlalchemy
./ApiStudio.sh
cd API-STUDIO
cd ApiStudio
pip install sqlalchemy

cd
./ApiStudio.sh
nano ApiStudio.sh
PGPASSWORD='M!cr0ap!*C$E*' psql -U microapi -h localhost -p 5432 -d apicloud
sudo -u postgres psql
cd
PGPASSWORD='M!cr0ap!*C$E*' psql -U microapi -h localhost -p 5432 -d apicloud
sudo nano /etc/postgresql/16/main/postgresql.conf
sudo netstat -tuln | grep 5432
sudo netstat -tuln | grep 5432
sudo ufw allow 5432/tcp
sudo iptables -A INPUT -p tcp --dport 5432 -j ACCEPT
psql -U microapi -h <server-ip> -p 5432 -d apicloud
psql -U microapi -h 127.0.0.1 -p 5432 -d apicloud
sudo nano /etc/postgresql/16/main/ pg_hba.conf
sudo nano /etc/postgresql/16/main/pg_hba.conf
sudo systemctl restart postgresql
sudo systemctl reload postgresql
sudo ufw allow 5432/tcp
sudo apt update
sudo apt install net-tools
sudo apt install ufw
sudo apt install iptables
psql -U microapi -h 127.0.0.1 -p 5432 -d apicloud
hostname -I
v
sudo netstat -tuln | grep 5432
sudo ufw allow 5432/tcp
sudo ufw allow 5432/tcp
ip addr show
ifconfig
curl ifconfig.me
sudo systemctl status postgresql
sudo netstat -tuln | grep 5432
sudo ufw allow 5432/tcp\
sudo ufw allow 5432/tcp
sudo iptables -A INPUT -p tcp --dport 5432 -j ACCEPT
psql -h 127.0.0.1 -U microapi -p 5432 -d apicloud
ifconfig
psql -h 127.0.0.1 -U microapi -p 5432 -d apicloud
sudo -u postgres psql
sudo systemctl reload postgresql
psql -h 127.0.0.1 -U microapi -p 5432 -d apicloud
psql -h localhost -U microapi -p 5432 -d apicloud
psql -h 172.27.226.245 -U microapi -p 5432 -d apicloud
ls
psql -h localhost -U microapi -p 5432 -d apicloud
python manage.py runserver 0.0.0.0:8005
python3 manage.py runserver 0.0.0.0:8005
cd API-STUDIO
cd ApiStudio
python3 manage.py runserver 0.0.0.0:8005
source venv/bin/activate
pip install psycopg2-binary
python manage.py runserver 8005
sudo lsof -i :8005
kill -9 735
python manage.py runserver 8005
kill -9 735
sudo lsof -i :8005
sudo fuser -k 8005/tcp

8005/tcp:             1920
python manage.py runserver 8005
cd
cd API-STUDIO
cd ApiStudio
ls
sudo pkill -f python
sudo lsof -i :8005
sudo pkill -f python
sudo lsof -i :8005
sudo pkill -f python
sudo kill -9 2721
sudo lsof -i :8005
sudo kill -9 2829
python manage.py runserver 8005
python manage.py runserver 8005
python manage.py runserver 8005
ls
./ApiStudio.sh
sudo lsof -i :8005
sudo kill -9 2988
sudo lsof -i :8005
sudo kill -9 3556
sudo netstat -tulnp | grep :8005
sudo kill -9 3658
sudo lsof -i :8005
cd API-STUDIO
cd ApiStudio
pip install Django
lssudo apt update
sudo apt install python3 python3-pip python3-venv
cd
cd /API-STUDIO/ApiStudio
cd API-STUDIO/ApiStudio
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
pip install psycopg2\
pip install psycopg2
v
python manage.py runserver 8005
python manage.py runserver 8005
cd
./apistudio_all.sh
./apistudio_all.sh
nano apistudio_all.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
sudo systemctl status gunicorn_apistudio.service
sudo systemctl status apistudio.service
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
ls
cd /API-STUDIO/ApiStudio
cd API-STUDIO/ApiStudio
ls
cd ApiStudio
ls
cd settings.py
nano settings.py
PGPASSWORD='M!cr0ap!*C$E*' psql -h localhost -U microapi -d apicloud
ls
nano settings.py

nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
nano ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
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
sudo nano /etc/systemd/system/nginx.service
sudo nano /etc/systemd/system/apistudio.service
chmod +x ApiStudio.sh
./ApiStudio.sh
systemctl daemon-reload
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
sudo systemctl status apistudio.service
ip addr show eth0
hostname -I
python manage.py runserver 0.0.0.0:8000
python3 manage.py runserver 0.0.0.0:8005
cd API-STUDIO/ApiStudio
python3 manage.py runserver 0.0.0.0:8005
cd ApiStudio
python3 manage.py runserver 0.0.0.0:8005
nano setting.py
ls
nano settings.py
chmod +x settings.py
cd ApiStudio
cd 
cd API-STUDIO/ApiStudio
python3 manage.py runserver 0.0.0.0:8005
cd
./ApiStudio.sh
./sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
ApiStudio.sh
sudo systemctl daemon-reexec
/home/mani/API-STUDIO/ApiStudio/venv/bin/python
./ApiStudio.sh
systemctl status apistudio.service
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
clear
nano ApiStudio.sh
./ApiStudio.sh
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
./ApiStudio.sh
systemctl status apistudio.service
cd API-STUDIO/ApiStudio
cd ApiStudio
ls
nano settings.py
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
cd
./ApiStudio.sh
journalctl -xeu apistudio.service
journalctl -xeu apistudio.service
cd /home/mani/API-STUDIO/ApiStudio
source venv/bin/activate
python manage.py runserver 172.27.226.245:8005
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
cd
cd API-STUDIO/ApiStudio
cd ApiStudio
nano settings.py
cd /home/mani/API-STUDIO/ApiStudio
source venv/bin/activate
python manage.py runserver 172.27.226.245:8005
cd
./ApiStudio.sh
nanoApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
cd API-STUDIO/ApiStudio
cd ApiStudio
nano settings.py
chmod +x settings.py
cd
./ApiStudio.sh
sudo systemctl restart apistudio.service
sudo systemctl status apistudio.service
./ApiStudio.sh
sudo systemctl restart apistudio.service
sudo systemctl status apistudio.service
chmod +x ApiStudio.sh
./ApiStudio.sh
systemctl status apistudio.service
sudo nano /etc/systemd/system/apistudio.service
systemctl status apistudio.servicesudo systemctl restart apistudio.service
sudo systemctl restart apistudio.service
systemctl daemon-reload
sudo systemctl daemon-reload
xsudo systemctl restart apistudio.service
sudo systemctl restart apistudio.service
sudo systemctl status apistudio.service
./ApiStudio.sh
nano ApiStudio.sh
nano ApiStudio.sh
journalctl -xeu apistudio.service\
journalctl -xeu apistudio.service
./ApiStudio.sh
/home/mani/API-STUDIO/ApiStudio/venv/bin/python manage.py dbshell
/home/mani/API-STUDIO/ApiStudio/ApiStudio/venv/bin/python manage.py dbshell
journalctl -xeu apistudio.service
sudo service postgresql status
sudo service postgresql start
/home/mani/API-STUDIO/ApiStudio/venv/bin/python manage.py shell
cd /home/mani/API-STUDIO/ApiStudio
./venv/bin/python manage.py shell
cd ApiStudio
nano setting.py
nano settings.py
cd
nano check_db.sh
chmod +x chack_db.sh
chmod +x check_db.sh
./check_db.sh
./ApiStudio.sh
ls
nano setup_postgres.sh
nano install.log
realpath init_db.sql
nano  setup_postgres.sh
chmod +x setup_postgres.sh
./setup_postgres.sh
./check_db.sh
nano check_db.sh
chmod +x check_db.sh
./check_db.sh
sudo systemctl status postgresql
telnet 172.27.226.245 5432
sudo ufw allow 5432/tcp
sudo apt install inetutils-telnet
sudo nano /etc/postgresql/16/main/pg_hba.conf
sudo systemctl restart postgresql
sudo systemctl restart postgresql
sudo systemctl status postgresql
sudo nano /etc/postgresql/16/main/postgresql.conf
sudo systemctl restart postgresql
sudo systemctl restart postgresql
sudo systemctl status postgresql
sudo -u postgres psql
sudo tail -f /var/log/postgresql/install.log
sudo tail -f /var/log/postgresql/postgresql-*.log
./check_db.sh
sudo nano /etc/postgresql/16/main/pg_hba.conf
sudo systemctl restart postgresql\
sudo systemctl restart postgresql
sudo systemctl restart postgresql
cat /etc/resolv.conf | grep nameserver
sudo nano /etc/postgresql/16/main/pg_hba.conf
sudo systemctl restart postgresql
sudo systemctl status postgresql
cd API-STUDIO/ApiStudio/ApiStudio
nano settings.py
cd
ping 10.255.255.254
psql -h 10.255.255.254 -U microapi -d apicloud
nano check.py
chmod +x check.py
python3 check.py
nano check.py
sudo apt update
sudo apt install python3-psycopg2
pip install psycopg2-binary
python3 check.py
python3 manage.py dbshell
cd API-STUDIO/ApiStudio/ApiStudio
python3 manage.py dbshell
cd API-STUDIO/ApiStudio
cd
cd API-STUDIO/ApiStudio
python3 manage.py dbshell
cd 
./check_db.sh
nano check_db.sh
nano check_db.sh
chmod +x check_db.sh
./check_db.sh
python3 check.py
nano check.py
./ApiStudio.sh
PGPASSWORD='M!cr0ap!*C$E*' psql -U microapi -h 10.255.255.254 -p 5432 -d apicloud -c 'SELECT 1;'
cd API-STUDIO/ApiStudio
cd ApiStudio
ls
nano settings.py
settings.py
python manage.py migrate
python3 manage.py migrate
cd
cd API-STUDIO/ApiStudio
python3 manage.py migrate
python manage.py shell
python3 manage.py shell
pip install backports.configparser
error: externally-managed-environment
× This environment is externally managed
╰─> To install Python packages system-wide, try apt install
    python3-xyz, where xyz is the package you are trying to
    install.
    If you wish to install a non-Debian-packaged Python package,
    create a virtual environment using python3 -m venv path/to/venv.
    Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
    sure you have python3-full installed.
    If you wish to install a non-Debian packaged Python application,
    it may be easiest to use pipx install xyz, which will manage a
    virtual environment for you. Make sure you have pipx installed.
    See /usr/share/doc/python3.12/README.venv for more information.
note: If you believe this is a mistake, please contact your Python installation or OS distribution provider. You can override this, at the risk of breaking your Python installation or OS, by passing --break-system-packages.
hint: See PEP 668 for the detailed specification.
sudo pip3 install backports.configparser
cd
sudo pip3 install backports.configparser
python3 -m venv venv
source venv/bin/activate
pip install backports.configparser
ls
http://172.27.226.245/
sudo service postgresql start
sudo ss -nlpt | grep postgres
sudo nano /etc/postgresql/*/main/pg_hba.conf
sudo service postgresql restart
exit
cd API-STUDIO/ApiStudio
cd APiStudio
cd ApiStudio
nano settings.py
cd
cd API-STUDIO/ApiStudio
python manage.py migrate
python3 manage.py migrate
from backports import configparser
sudo apt install mailutils
sudo nano /home/mani/API-STUDIO/ApiStudio/user_master/usermaster.py
python3 manage.py migrate
sudo nano /home/mani/API-STUDIO/ApiStudio/user_master/usermaster.py
nano settings.py
cd ApiStudio
nano settings.py
import markdown
pip install markdown
cd
cat /etc/resolv.conf | grep nameserver
# Sample output: nameserver 172.27.224.1
cat /etc/resolv.conf | grep nameserver
cd API-STUDIO/ApiStudio
cd ApiStudio
nano settings.py
cd
sudo apt-get install postgresql-client
python manage.py check
cd API-STUDIO/ApiStudio
python manage.py check
python3 manage.py check
pip install markdown
sudo pip install markdown
python3 -m venv myenv
source myenv/bin/activate
myenv\Scripts\activate
myenv/Scripts/activate
pip install markdown
sudo apt install pipx\
sudo apt install pipx
pipx install markdown\
pipx install markdown
sudo apt search python3-markdown
python3 manage.py check
cd
python manage.py check
cd API-STUDIO/ApiStudio
python manage.py check
cd
\q
deactivate
cd API-STUDIO/ApiStudio
python manage.py check
python3 manage.py check
ls
nano requirements.txt
pip install -r requirements.txt
cd
./ApiStudio.sh
pip install -r requirements.txt
cd API-STUDIO/ApiStudio
source venv/bin/activate
pip install -r requirements.txt
python3 manage.py check
python manage.py shell
python manage.py runserver 0.0.0.0:8005
sudo -u postgres psql -c "SHOW hba_file;"
sudo nano /etc/postgresql/16/main/pg_hba.conf
sudo systemctl reload postgresql
python manage.py runserver 0.0.0.0:8005
cd
ls
./check_db.sh
nano check_db.sh
sudo -u postgres psql
ALTER USER microapi WITH PASSWORD 'newpassword';

sudo nano /etc/postgresql/16/main/pg_hba.conf
sudo systemctl reload postgresql\
sudo systemctl reload postgresql
psql -h 10.255.255.254 -U microapi -d apicloud
./check_db.sh
./ApiStudio.sh
cd API-STUDIO/ApiStudio
source venv/bin/activate
python manage.py createsuperuser
psql -h 10.255.255.254 -U microapi -d apicloud
cd
ls
nano check.py
nano ApiStudio.sh
nano check_db.sh
chmod +x check_db.sh
./check_db.sh
nano check_db.sh
chmod +x check_db.sh
./check_db.sh
nano check.py
python3 check.py
nano check.py
nano check_db.sh
chmod +x check_db.sh
./check_db.sh
nano check_db.sh
nano check_db.sh
chmod +x check_db.sh
./check_db.sh
nano check_db.sh
chmod +x check_db.sh
./check_db.sh
nano check_db.sh
ls
ano run_all.sh
nano run_all.sh
chmod +x run_all.sh
./run_all.sh
nano run_all.sh
chmod +x run_all.sh
./run_all.sh
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       ./ApiStudio.sh
cd API-STUDIO/ApiStudio
venv\Scripts\activate
venv/Scripts/activate
venv/bin/activate
source venv/bin/activate
python manage.py runserver 172.27.226.245:8005
python manage.py runserver 172.27.226.245:8005
sudo lsof -i :8005
sudo kill -9 12345
sudo lsof -i :8005
sudo kill -9 9503
sudo lsof -i :8005
sudo kill -9 10161
sudo lsof -i :8005
sudo lsof -i :8005
sudo kill -9 10268
sudo lsof -i :8005
python manage.py runserver 172.27.226.245:8005
cd
./ApiStudio.sh
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
sudo systemctl status apistudio.service
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service

nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
 sudo systemctl restart apistudio.service
sudo systemctl status apistudio.service
 sudo systemctl restart apistudio.servic
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
sudo nano etc/nginx/conf.d/microapi.conf
sudo nano etc/nginx/conf.d/microapi.conf
sudo nano /etc/nginx/conf.d/microapi.conf
nano ApiStudio.sh
sudo nano /etc/nginx/conf.d/apistudio.conf
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
 sudo systemctl restart apistudio.servic
 sudo systemctl restart apistudio.service
sudo systemctl status apistudio.service
ls
./Crudapp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
nano Crudapp.sh
sudo lsof -i :8000
curl http://127.0.0.1:8000/crudapp
curl http://127.0.0.1:8000
source /home/mani/API-STUDIO/CrudApp/venv/bin/activate
pip install python-magic
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
cd /home/mani/API-STUDIO/CrudApp
ls main.py
source venv/bin/activate
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
nano Crudapp.sh
nano Crudapp.sh
chmod +X Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
cd API-STUDIO/CrudApp
ls main.py
source venv/bin/activate
uvicorn main:app --host 172.27.226.245 --port 8000 --reload
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
source /home/mani/API-STUDIO/CrudApp/venv/bin/activate
pip install python-magic
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
ls
nano new_req.txt
cd
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
cd API-STUDIO/CrudApp
nano new_req.txt
cd
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
./ApiStudio.sh
systemctl status apistudio.service
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service

nano ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
systemctl status apistudio.service
nano ApiStudio.sh
ls
cd API-STUDIO
ls
cd ApiStudio
ls
nano config.ini
cd
./ApiStudio.sh
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
systemctl status apistudio.service
cd API-STUDIO
cd ApiStudio
nano config.ini
nano config.ini
cd 
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
sudo systemctl restart apistudio.service
systemctl status apistudio.service
nano config.ini
cd API-STUDIO
cd ApiStudio
nano config.ini
cd
sudo nano /etc/systemd/system/apistudio.service
sudo nano /etc/systemd/system/cruudapp.service
sudo nano /etc/systemd/system/crudapp.service
sudo nano /etc/systemd/system/crudapp.service
nano Crudapp.sh
sudo nano /etc/nginx/sites-available/CrudApp
cd API-STUDIO
cd ApiStudio
nano config.ini
cd
nano ApiStudio.sh
nano Crudapp.sh
./Crudapp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
nano Crudapp.sh
ls
nano Crudapp.sh
ls
nano GetApi.sh
chmod +x GetApi.sh
./GetApi.sh
nano GetApi.sh
chmod +x GetApi.sh
./GetApi.sh
ls
nano GetApi.sh
                                                                                                                                                                                                                                                                                                                                                          ls
cd ApiStudio
cd Apistudio
ls
cd
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
sudo systemctl restart apistudio.service
systemctl status apistudio.service
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl restart apistudio.service
'systemctl daemon-reload
systemctl daemon-reload
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
systemctl status apistudio.service
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
systemctl status apistudio.service
sudo -i
./ApiStudio.sh
sudo systemctl restart apistudio.service
systemctl status apistudio.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
systemctl status apistudio.service
nano ApiStudio.sh
nano ApiStudio.sh
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
systemctl status apistudio.service
source /home/mani/Apistudio/ApiStudio/venv/bin/activate
pip install psycopg2-binary
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl daemon-reload
chmod +x ApiStudio.sh
./ApiStudio.sh
sudo systemctl restart apistudio.service
systemctl status apistudio.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
systemctl status apistudio.service
cd /home/mani/Apistudio/ApiStudio
source venv/bin/activate
python manage.py runserver 172.27.226.245:8005
pip show psycopg2-binary
ls
nano req.txt
nano 1.txt
cd
exit
sudo ls /root/
ls
./ApiStudio.sh
cd Apistudio/ApiStudio
venv/bin/active
venv/bin/activate
source venv/bin/activate
python manage.py runserver 8005
ls
nano req.txt
cd
nano ApiStudio.sh
chmod +x ApiStudipo.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
cd Apistudio/ApiStudio
source venv/bin/activate
python manage.py runserver 8005
ls
nano req.txt
nano 1.txt
nano 1.txt
cd
./ApiStudio.sh
nano 1.txt
cd Apistudio/ApiStudio
nano 1.txt
cd
./ApiStudio.sh
cd Apistudio/ApiStudio
python manage.py runserver 8005
ls
pip freeze > requirements.txt.
pip freeze > requirements.txt
ls
nano requirements.txt
python manage.py runserver 8005
pip install PyJWT
python manage.py runserver 8005
pip install backport
pip install backports
pip install backports[]
pip install backport
pip install PyJWT
python manage.py runserver 8005
pip install backports.configparser
cd
ls
nano setup.sh
nano setup_depend.sh
nano setup_apistudio_pre.sh
chmod +x setup_apistudio_pre.sh
./setup_apistudio_pre.sh
./setup_apistudio_pre.sh
python3.11 -V
python3 -V
python -V
python3.11 -V
psql -V\
psql -V
nano setup.sh
nano setup_depend.sh
./setup_apistudio_pre.sh
nano setup_apistudio_pre.sh
chmod +x setup_apistudio_pre.sh
./setup_apistudio_pre.sh
./setup_depend.sh
nano setup_depend.sh
sudo nano /etc/systemd/system/apistudio.service
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
./ApiStudio.sh
sudo nano /etc/systemd/system/apistudio.service
sudo nano /etc/systemd/system/apistudio.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart apistudio.service
./ApiStudio.sh
cd Apistudio/ApiStudio
cd API-STUDIO/ApiStudio
source venv/bin/activate
python manage.py runserver 8005
nano requiremnts.txt
nano requirements.txt
python manage.py runserver 8005
pip install -r requirements.txt
python manage.py runserver 8005
nano requirements.txt
pip install -r requirements.txt
nano requirements.txt
pip install -r requirements.txt
nano requirements.txt
pip install -r requirements.txt
pip install -r requirements.txt
nano requirements.txt
nano requirements.txt
pip install -r requirements.txt
pip install -r requirements.txt
python manage.py runserver 8005
python manage.py runserver 8005
python manage.py runserver 8005
python manage.py runserver 8005
python manage.py runserver 172.27.226.245:8005
python manage.py runserver 172.27.226.245:8005
python manage.py runserver 172.27.226.245:8005
sudo cp /mnt/c/Users\manik\OneDrive\Documents\Apistudio /root/  
sudo cp /mnt/c/Users/manik/OneDrive/Documents/Apistudio /root/  
sudo cp -r /mnt/c/Users/manik/OneDrive/Documents/Apistudio /root/  
ls
./Crudapp.sh
./setup_postgres.sh
ls
nano DBSchemaApi.sh
./DBSchemaApi.sh
cd API-STUDIO/DBSchema
cd API-STUDIO/DBSchemaApi
ls
nano req.txt
source venv/bin/activate
uvicorn main:app --reload --port 8006
sudo apt install uvicorn
sudo apt install uvicorn
uvicorn main:app --reload --port 8006
nano req.txt
uvicorn main:app --reload --port 8006
uvicorn main:app --reload --port 172.27.226.245:8006
cd
sudo nano etc/systemd/system/dbschema.service
cd API-STUDIO/DBSchemaApi
pip install sqlalchemy
python3.12 -m pip install sqlalchemy
uvicorn main:app --reload --port 8006
source venv/bin/activate  # or . venv/bin/activate
pip install sqlalchemy
python3 -m pip install sqlalchemy
python3.11 -m pip install sqlalchemy
uvicorn main:app --reload --port 8006
python3.12 -m pip install sqlalchemy
pip install psycopg2-binary
pip install sqlalchemy psycopg2-binary
pip install sqlalchemy psycopg2-binary
uvicorn main:app --reload --port 8006
python3.11 -m pip install SQLALchemy
nano req.txt
rm venv
rm -r venv
ls
nano req.txt
pip install -m req.txt
pip install -r req.txt
ls
cd
./DBSchemaApi.sh
cd API-STUDIO/DBSchemaApi
ls
nano req.txt
nano DBSchemaApi.sh
cd
nano DBSchemaApi.sh
pip install -r req.txt
cd API-STUDIO/DBSchemaApi
pip install -r req.txt
nano req.txt
pip install -r req.txt
sudo apt update
sudo apt install libgpgme-dev
pip install gpgme-config
pip install -r req.txt
cd
./DBSchemaApi.sh
sudo nano /etc/systemd/system/DBSchemaApi.service
./DBSchemaApi.sh
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart DBSchemaApi.service
./DBSchemaApi.sh
ls
nano DeleteApi.sh
nano CoreApi.sh
chmod +x CoreApi.sh
./CoreApi.sh
sudo nano /etc/systemd/system/CoreApi.service
./CoreApi.sh
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart CoreApi.service
systemctl status CoreApi.service
./CoreApi.sh
nano CoreApi.sh
nano CoreApi.sh
chmod +x CoreApi.sh
./CoreApi.sh
nano CoreApi.sh

nano CoreApi.sh
sudo systemctl status nginx
sudo nano /etc/systemd/system/nginx.service
ls
nano DeleteApi.sh
./DeleteApi.sh
nano DeleteApi.sh
nano CoreApi.sh
chmod +x CoreApi.sh
./CoreApi.sh
cd API-STUDIO/CrudApp
source venv/bin/activate
pip install uvicorn
cd
sudo nano etc/systemd/system/CrudApp.service
sudo nano etc/systemd/system/Crudapp.service
sudo nano etc/systemd/system/crudapp.service
./CoreApi.sh
./CrudApp.sh
./Crudapp.sh
deactivate
./Crudapp.sh
 sudo nano  /etc/systemd/system/CrudApp.service
sudo systemctl daemon-reload
sudo systemctl restart CrudApp.service
systemctl status  CrudApp.service
ls -l /home/mani/API-STUDIO/CrudApp/venv/bin/uvicorn
source /home/mani/API-STUDIO/CrudApp/venv/bin/activate
pip install uvicorn
 sudo nano  /etc/systemd/system/CrudApp.service
sudo systemctl daemon-reload
sudo systemctl restart CrudApp.service
systemctl status  CrudApp.service
nano Crudapp.sh
chmod +x CrudApp.sh
chmod +x Crudapp.sh
./Crudapp.sh
deactivate
./Crudapp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
cd API-STUDIO/CrudApp
ls
python3 -m venv venv
source venv/bin/activate
pip install new_req.txt
pip install req.txt
nano req.txt
nano 1.txt
pip install 1.txt
pip3 install 1.txt
pip install -r 1.txt
uvicorn main:app --port 8000  --reload
nano CrudApp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
systemctl status nginx.service
sudo nano etc/systemd/system/nginx.servic
sudo nano etc/systemd/system/nginx.service
nginx -T | grep pid
sudo nano /etc/nginx/nginx.conf
sudo nano /etc/nginx/nginx.conf
pid /usr/local/nginx/logs/nginx.pid;
error_log /usr/local/nginx/logs/error.log warn;
access_log /usr/local/nginx/logs/access.log main;
ls
./ApiStudio.sh
cd API-STUDIO/ApiStudio
pip install -r req.txt
ls
pip install -r requirements.txt
source venv/bin/activate
pip install -r requirements.txt
python manage.py runserver 172.27.226.245:8005
dls -l /usr/local/nginx/logs/nginx.pid
ls -l /usr/local/nginx/logs/nginx.pid
cd
./ApiStudio.sh
nanoApiStudio.sh
nano ApiStudio.sh
chmod +x ApiStudio.sh
./ApiStudio.sh
cd API-STUDIO/ApiStudio
cd
deactivate
./ApiStudio.sh
cd API-STUDIO/ApiStudio
source venv/bin/activate
python3 manage.py runserver 172.27.226.245:8005
pip install PyJWT
python3 manage.py runserver 172.27.226.245:8005
python3 manage.py runserver 172.27.226.245:8005
python3 manage.py runserver :8005
python3 manage.py runserver 172.27.226.245:8005
python3 manage.py runserver 172.27.226.245:8005
ls
./setup_postgres.sh
ls
nano CmsPAge.sh
nano CmsPage.sh
chmod +x CmsPage.sh
./CmsPage.sh
ls
./DBSchemaApi.sh
ls
cd API-STUDIO/DBSchemaApi
ls
uvicorn main:app --reload --port 8006
source venv/bin/activate
pip install sqlalchemy psycopg2
uvicorn main:app --reload --port 8006
python3 -m pip install SQLAlchemy
pip install psycopg2-binary
uvicorn main:app --reload --port 8006
ls
./CoreApi.sh
cd API-STUDIO/CoreApi
ls
source venv/bin/activate
pip install -r req.txt 
uvicorn main:app --port 8007 --reload
nano req.txt
nano req.txt
pip install -r req.txt 
pip3 install -r req.txt 
pip install Kacme==1.22.0 -v
python --version
pip install acme==1.22.0
pip3 install -r req.txt 
nano req.txt
pip3 install -r req.txt 
nano req.txt
pip3 install -r req.txt 
sudo apt update
sudo apt install libgpgme-dev
pip3 install -r req.txt 
sudo apt update
sudo apt install libgpgme-dev
pip3 install -r req.txt 
sudo apt update
sudo apt install libgpgme-dev
pip install gpg
sudo apt update
sudo apt install -y libgpgme-dev pkg-config python3-dev build-essential
\
pip install gpg
which gpgme-config
gpgme-config --version
sudo apt update && sudo apt install -y libgpgme-dev pkg-config python3-dev build-essential
sudo nano /etc/postfix/main.cf
sudo nano /etc/postfix/main.cf
sudo nano /etc/postfix/main.cf       # (to fix the config)
sudo systemctl reload postfix         # (apply the config)
sudo dpkg --configure -a             # (reconfigure broken packages)
sudo apt install -f                  # (auto-fix dependencies)
sudo nano /etc/postfix/main.cf       # (to fix the config)
sudo systemctl reload postfix         # (apply the config)
sudo dpkg --configure -a             # (reconfigure broken packages)
sudo apt install -f                  # (auto-fix dependencies)
uvicorn main:app --port 8007 --reload
pip install python-jose
uvicorn main:app --port 8007 --reload
uvicorn main:app --port 172.27.226.245:8007 --reload
uvicorn main:app  172.27.226.245:8007 --reload
cd
./CoreApi.sh
sudo nano /etc/nginx/microapi.conf
sudo nano /etc/nginx/conf.d/microapi.conf
sudo nginx -t
sudo systemctl reload nginx
sudo systemctl restart nginx
sudo nginx -t
sudo systemctl status nginx
sudo nano /etc/systemd/system/nginx.service
sudo nano /etc/systemd/system/nginx.service
sudo systemctl daemon-reload
sudo systemctl restart nginx
systemctl status nginx.service"
systemctl status nginx.service
ls -l /etc/nginx/conf.d/microapi.conf
sudo systemctl daemon-reload
sudo systemctl restart nginx
sudo chmod +x /usr/local/nginx/sbin/nginx
which nginx
sudo nano /etc/systemd/system/nginx.service
sudo systemctl daemon-reload
sudo systemctl restart nginx
systemctl status nginx.service
sudo nginx -t -c /etc/nginx/conf.d/microapi.conf
sudo nano /etc/systemd/system/nginx.service
sudo nginx -t -c /etc/nginx/conf.d/microapi.conf
sudo systemctl restart nginx
systemctl daemon-reload
sudo systemctl daemon-reload
sudo systemctl restart nginx
sudo systemctl restart nginx
systemctl status nginx.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart nginx
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart nginx
/etc/systemd/system/nginx.service
sudo nano /etc/systemd/system/nginx.service
sudo systemctl restart nginx
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart nginx
systemctl status nginx.service
sudo nano /etc/systemd/system/nginx.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart nginx
systemctl status nginx.service
which nginx
sudo nano /etc/systemd/system/nginx.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart nginx
systemctl status nginx.service
ls
./Crudapp.sh
sudo nano /etc/systemd/system/CrudApp.service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart CrudApp.service
systemctl status CrudApp.service
clear
ls
./Crudapp.sh
cd API-STUDIO/CrudApp
source venv/bin/activate
pip install uvicorn
clear
cd
deactiavte\
deactiavte
sourec deactiavte
source deactiavte
source venv/bin/deactiavte
ls -l /usr/local/nginx/logs/nginx.pid
deactivate
ls -l /usr/local/nginx/logs/nginx.pid
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
sudo systemctl restart nginx.service
systemctl status nginx.service
sudo nginx -t
sudo journalctl -u nginx.service --no-pager --since "5 minutes ago"
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx
sudo nginx -t
systemctl status nginx.service
./Crudapp.sh
systemctl status nginx.service
sudo systemctl reload  nginx.service
sudo systemctl reload nginx.service
sudo systemctl restart nginx.service
systemctl status nginx.service
./Crudapp.sh
nano Crudapp.sh
chmod +x Crudapp.sh
./Crudapp.sh
ls
nano GetApi.sh
chmod +x GetApi.sh
./GetApi.sh
pip uninstall SQLAlchemy
cls
clear
wsl
sudo service postgresql status
sudo service postgresql status
sudo service postgresql stop
sudo service postgresql status
sudo systemctl disable postgresql
sudo service postgresql status
ls
cd API-STUDIO/CrudApp
ls
rm -rf venv
ls
rm -rf venv
ls
nano venv
rm venv
rm -rf venv
rm -rf venv
chmod -R u+w venv/
rm -rf venv/
ls
pythom3 -m venv venv
python3 -m venv venv
source venv/bin/activate
pip install -r 1.txt
nano 1.txt
chmod -R u+w venv/
rm -rf venv/
chmod -R u+w venv/
rm -rf venv/
rm -rf venv/
sudo rm -rf venv/
deactivate
rm -rf venv/
ls
chmod -R u+w venv/
rm -rf venv/
sudo rm -rf venv/
chmod -R u+w venv/
rm -rf venv/
ls
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r 1.txt
uvicorn main:app --reload --port 172.27.226.245:8000
uvicorn main:app --reload --port :8000
pip install uvicorn fastapi
# Add other dependencies like sqlalchemy, psycopg2, etc.
pip install uvicorn fastapi
uvicorn main:app --reload --port :8000
uvicorn main:app --reload --port 8000
nano req.txt
nano 1.txt
pip install pydantic.color
pip install pydantic.color=1
pip install pydantic.color
cd /home/mani/API-STUDIO/CrudApp
rm -rf venv
python3 -m venv venv
source venv/bin/activate
ls
./ApiStudio.sh
sudo service postgresql start
sudo service postgresql status
sudo systemctl enable postgresql
sudo service postgresql status
cd API-STUDIO/ApiStudio
ls
rm -rf venv
ls
python -m venv venv
python3 -m venv venv
source venv/bin/activate
pip install -r req.txt
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver 8005
python manage.py runserver 172.27.226.245:8005
./Crudapp.sh
nano Crudapp.sh
ls
cd
ls
./Crudapp.sh
where wsl
exit
