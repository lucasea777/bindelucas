ansible-galaxy install gantsign.golang &&
export ANSIBLE_NOCOWS=1
ansible-playbook ~/bindelucas/install_all/ansible/golang_playbook.yml \
--user=pepe --extra-vars "ansible_sudo_pass=$(cat ~/binprivate/db/miqueridacontraes)"