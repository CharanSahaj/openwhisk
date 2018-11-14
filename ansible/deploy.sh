
echo "ping"
ansible all -i environments/test -m ping

echo setup
ansible-playbook -i environments/test setup.yml
echo prereq
ansible-playbook -i environments/test prereq_build.yml
echo couchdb
ansible-playbook -i environments/test initdb.yml 
echo wipe
ansible-playbook -i environments/test wipe.yml 
echo deploy
ansible-playbook -i environments/test openwhisk.yml
