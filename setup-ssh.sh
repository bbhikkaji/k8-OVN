#Install ssh-pass
sudo apt-get install sshpass

#Generate Key & Copy it to Minions.
su - vagrant
echo "getting on to vagrant "
ssh-keygen -b 2048 -t rsa -f ~/.ssh/id_rsa -q -N ""
echo $?
sshpass -p vagrant ssh-copy-id -o StrictHostKeyChecking=no vagrant@10.10.103.250
echo $?
sshpass -p vagrant ssh-copy-id -o StrictHostKeyChecking=no vagrant@10.10.103.223
echo $?
sshpass -p vagrant ssh-copy-id -o StrictHostKeyChecking=no vagrant@10.10.103.162
echo $?
