#!/bin/bash

INVENTORY=kubespray_inventory.ini

die() { echo "$0: die - $*" >&2; exit 1; }

#cd ~/z/TRAININGS.SETUP/Proxmox/bash-clusters/
cd $(dirname $0)

mkdir -p ~/tmp

[ ! -f "$INVENTORY" ] && die "No such inventory file as $INVENTORY"

mkdir -p src
[ ! -d src/kubespray ] && git clone https://github.com/kubernetes-sigs/kubespray src/kubespray

cd src/kubespray

ansible-playbook -i ../../$INVENTORY --become --become-user=root cluster.yml | tee ~/tmp/install_w_kubespray.op


