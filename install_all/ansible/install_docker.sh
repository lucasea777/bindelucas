ansible-galaxy install nickjj.docker
#ansible-galaxy install viasite-ansible.zsh
#ansible-galaxy install git+https://github.com/viasite-ansible/ansible-role-zsh.git
#ansible-playbook ~/bindelucas/install_all/ansible/site.yml -f 10 #--ask-sudo-pass;
export ANSIBLE_NOCOWS=1
ansible-playbook ~/bindelucas/install_all/ansible/site.yml -f 10 \
    --user=pepe --extra-vars "ansible_sudo_pass=$(cat ~/binprivate/db/miqueridacontraes)"

