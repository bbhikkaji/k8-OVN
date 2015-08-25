#Install ssh-pass
sudo apt-get install sshpass

#Generate Key & Copy it to Minions.
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
sshpass -p vagrant ssh-copy-id 10.10.103.250
sshpass -p vagrant ssh-copy-id 10.10.103.223
sshpass -p vagrant ssh-copy-id 10.10.103.162
