sudo apt-get install lsb --fix-missing
wget https://ssd.mathworks.com/supportfiles/downloads/R2022b/license_manager/R2022b/daemons/glnxa64/mathworks_network_license_manager_glnxa64.zip
unzip mathworks_network_license_manager_glnxa64.zip
cd etc
chmod +x lmutil.sh
./lmutil lmstat -a
