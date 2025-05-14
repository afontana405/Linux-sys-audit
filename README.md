# Linux-sys-audit

## Description

This shell script is designed to gather a comprehensive inventory of installed software and system components on a Linux machine. It automates the process of collecting package lists, executable files, system configurations, and network sockets, storing the results in an organized directory for later review. 

## Usage

After cloning this repository on a Linux machine:

1. **Navigate into the project directory**:  
   `cd Linux-sys-audit`

2. **Make the script executable**:  
   `chmod +x inventory.sh`

3. **Run the script**:  
   `./inventory.sh`

4. **View the results**:  
   The output of the system audit will be saved in a directory named `~/software_inventory`.

> 💡 **Note:** If you encounter a "Permission denied" error when trying to run the script, it’s because the file is not executable yet, step 2 fixes that.

## License 

Please refer to the LICENSE in the repo.
