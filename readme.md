<!-- build docker image and run it -->
ansible-playbook -i localhost myplay.yml

<!-- stop container and delete image -->
ansible-playbook -i localhost undeploy.yml