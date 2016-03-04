#!/usr/bin/env bash

set -eux

echo "Running initial-setup yum update"
yum upgrade -y 
echo "Finished running initial-setup yum update"

echo "Installing basic development tools (CentOS)"
yum -y groupinstall "Development Tools"
echo "Finished installing basic development tools (CentOS)"

echo "Installing the epel repository"
yum install -y epel-release
