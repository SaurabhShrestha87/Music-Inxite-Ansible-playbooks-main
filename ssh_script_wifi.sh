#!/bin/bash

# Function to print messages in green color
print_info() {
    echo -e "\e[32m$1\e[0m"
}

# Function to print messages in red color
print_error() {
    echo -e "\e[31m$1\e[0m"
}

# Function to show a Zenity password prompt and store the result in the $PASSWORD variable
get_password() {
    PASSWORD=$(zenity --password --title "Enter Root Password" --width=300)
}

# Install OpenSSH server if not already installed
print_info "Installing OpenSSH server..."
sudo apt-get install -y openssh-server


# Add the public keys to the authorized_keys file
print_info "Adding public keys to authorized_keys..."
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDE1DbXnwhTJpjuNzEDTN93Q2TtEDxoMOO4eqEapi0wXArXlGIfxK8aFMWQpTYqfzsNUXK84auxnvPv3USfPHpZ80YD2dJKbRbIpAKt8pFv3BaFN00VJ+dJr3XYBLvdE51ZD2TYC26I+4w5qUH1dsHRp/FDFfNgh2iu2JQjmqHVnp5bbyvIICxcPBNIAneIQG2yMqKvreS3OmpDGMOFXzX/TWKG4wP51C+4+Xo7sZW2wc4Maoatk/v5yRYCTgOcBDGbapz9S1tpHrvPLtYMZXLS6SQtChTTtUhrZcbF659Ga1j9JcG9lznQmTycDM9+TFBzfAQpxNWw5CJYeJ71LYLUAEpnkIZ1HwkSkC4hJhUfrzpmV7bUugtvSEWW9f5wx0f3bVFeaX3OLPVdDqtKcirq8M7KICvC1HsZExb98p4ktPcw253/Qxzy9ztdCtd5SwOBYky13HuNxPGSsiT0QIPINPlqiec+rFTS8+3q2Z/3DDAm1lyxiA/YIBhAQ1Sy2Is= hp-pc@hppc-HP-Slimline-Desktop-PC-270-p0xx" >> ~/.ssh/authorized_keys

echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGxu5gcdzEcUpFy3T/iR746SkKBGy5CYvtZ3KQyzsfPg patrick@macos" >> ~/.ssh/authorized_keys

# Set appropriate permissions for the authorized_keys file
chmod 600 ~/.ssh/authorized_keys

# OpenSSH daemon configuration - Disable root login and password authentication
print_info "Configuring SSH server..."
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# Restart SSH service to apply the configuration changes
print_info "Restarting SSH service..."
sudo service ssh restart

# Check if restarting SSH service was successful
if [ $? -eq 0 ]; then
    print_info "SSH server configuration applied successfully."
else
    print_error "Failed to restart SSH service. Please check the SSH configuration."
    exit 1
fi

# Get the IP address using the 'hostname' command
ip_address=$(hostname -I | awk '{print $1}')

# Print the IP address
echo "IP Address: $ip_address"

username=$( whoami | awk '{print $1}')

# Print the username
echo "username: $username"

print_info "Finished : SSH setup completed successfully. You can now SSH into your Debian/Ubuntu PC using the specified username and above IP address."
