#!/bin/bash

# Function to print messages in green color
print_info() {
    zenity --info --text="$1" --width=300
}

# Function to print messages in red color
print_error() {
    zenity --error --text="$1" --width=300
}

# Function to show a Zenity password prompt and store the result in the $PASSWORD variable
get_password() {
    PASSWORD=$(zenity --password --title "Enter Root Password" --width=300)
}

# Fetch the active network interface dynamically
INTERFACE=$(nmcli connection show --active | grep -E 'Wired|Wi-Fi' | grep -Po '(Wired|Wi-Fi) connection \d+' | head -1)

# Check if INTERFACE is not empty
if [ -z "$INTERFACE" ]; then
    print_error "Failed to determine the active network interface."
    exit 1
fi

# Replace the following variables with your desired configuration
STATIC_IP="192.168.1.100"  # Replace with the desired static IP address
PREFIX_LENGTH="24"  # Replace with the prefix length of your subnet mask (e.g., 24 for /24)
GATEWAY="192.168.1.1"  # Replace with the IP address of your gateway/router
DNS_SERVER="8.8.8.8"  # Replace with the IP address of your preferred DNS server

# Install OpenSSH server if not already installed
print_info "Installing OpenSSH server..."
sudo apt-get update
sudo apt-get install -y openssh-server

# Set the static IP address
print_info "Configuring static IP address..."
sudo nmcli connection modify "${INTERFACE}" ipv4.method manual ipv4.addresses "${STATIC_IP}/${PREFIX_LENGTH}" ipv4.gateway "${GATEWAY}" ipv4.dns "${DNS_SERVER}"
sudo nmcli connection down "${INTERFACE}"
sudo nmcli connection up "${INTERFACE}"

# Check if setting the static IP was successful
if [ $? -eq 0 ]; then
    print_info "Static IP address set successfully."
else
    print_error "Failed to set static IP address. Please check your network configuration."
    exit 1
fi

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

print_info "SSH setup completed successfully. You can now SSH into your Debian/Ubuntu PC using the specified username and static IP address."
