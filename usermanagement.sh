#!/bin/bash

# Check if username is provided
if [ -z "$1" ]; then
    echo "run: $0 <username>"
    exit 1
fi

USERNAME="$1"

# Create a new user
echo "Creating user $USERNAME..."
sudo adduser "$USERNAME"

# Setup SSH access
echo "Setting up SSH for $USERNAME..."
sudo mkdir -p /home/"$USERNAME"/.ssh
sudo chmod 700 /home/"$USERNAME"/.ssh
sudo ssh-keygen -t rsa -b 2048 -f /home/"$USERNAME"/.ssh/id_rsa -N ""
sudo cp /home/"$USERNAME"/.ssh/id_rsa.pub /home/"$USERNAME"/.ssh/authorized_keys
sudo chmod 600 /home/"$USERNAME"/.ssh/authorized_keys
sudo chown -R "$USERNAME":"$USERNAME" /home/"$USERNAME"/.ssh

# List all users
echo "Listing all users:"
cut -d: -f1 /etc/passwd


# Give sudo access
echo "Granting sudo access to $USERNAME..."
sudo usermod -aG sudo "$USERNAME"

# Remove user (optional)
# echo "Removing user $USERNAME..."
# sudo deluser --remove-home "$USERNAME"

echo "Script completed!"