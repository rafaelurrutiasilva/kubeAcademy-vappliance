#!/bin/bash
#
# This script will install all the software you need to install discribed in the Lessons nr 2 "Setting Up Your Workstation" for
# https://kube.academy/courses/building-applications-for-kubernetes
#

if [[ ! $(uname -n) = "photon-machine" ]];then
    echo "You are not running Photon OS as Linux OS!"
    echo "You need to replace 'tdnf' package manager whit the one used in your Linux OS."
    exit
fi

# Preparing the basic
systemctl enable docker
tdnf install tar -y
tdnf update -y
# Variable definations
kindVersion=v0.20.0
kubesealVersion=0.20.2


# https://kind.sigs.k8s.io/docs/user/quick-start
echo " Installing kind..."
kindversion=v0.20.0
curl -Lo ./kind https://kind.sigs.k8s.io/dl/$kubeseal/kind-linux-amd64
install -o root -g root -m 0755 kind /usr/local/bin/
rm kind
echo ""

# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
echo " Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
install -o root -g root -m 0755 kubectl /usr/local/bin/
rm kubectl
echo ""

# https://kubectl.docs.kubernetes.io/installation/kustomize/binaries/
echo " Installing kustomize..."
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash > /dev/null 2>&1
install -o root -g root -m 0755 kustomize /usr/local/bin/
rm kustomize
echo ""

# https://helm.sh/docs/intro/install/
echo " Installing helm..."
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 |bash > /dev/null 2>&1
chmod 755 /usr/local/bin/helm
echo ""

# https://skaffold.dev/docs/install/
echo " Installing skaffold..."
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
install -o root -g root -m 0755 skaffold /usr/local/bin/
rm skaffold
echo ""

# https://github.com/bitnami-labs/sealed-secrets
echo " Installing kubeseal..."
curl -k -L  https://github.com/bitnami-labs/sealed-secrets/releases/download/v$kubesealVersion/kubeseal-${kubesealVersion}-linux-amd64.tar.gz -o kubeseal-${kubesealVersion}-linux-amd64.tar.gz
tar -xvzf kubeseal-${kubesealVersion}-linux-amd64.tar.gz kubeseal
install -m 755 kubeseal /usr/local/bin/
rm kubeseal
rm kubeseal-${kubesealVersion}-linux-amd64.tar.gz
