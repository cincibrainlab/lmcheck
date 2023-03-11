# MATLAB Network License Checker

This Bash script checks the usage information for a specific license (MATLAB in this case) using lmutil lmstat -a, and prints the information in a formatted table. The user, host, and display columns are set to specific widths, and the column command is used to align the columns.

The script also checks if the license server is down and prints a message in bright red.

## Requirements

- Bash shell
- lmutil (provided by Mathworks)
  - https://www.mathworks.com/support/install/license_manager_files.html

### Linux installation
* cd <Matlab Directory>, i.e. /opt/matlab/R2021
* wget https://ssd.mathworks.com/supportfiles/downloads/R2022b/license_manager/R2022b/daemons/glnxa64/mathworks_network_license_manager_glnxa64.zip
* unzip files
* sudo apt-get install lsb --fix-missing

## Usage

1. Clone or download the repository.
2. Modify the script to check the usage for the desired license by changing the argument to the `-f` option in the `lmutil lmstat -a -f` command. In the current script, the license checked is `MATLAB`.
3. Modify the institution name
4. Run the script using the command `./license_checker.sh`.
