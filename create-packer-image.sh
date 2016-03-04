#!/usr/bin/env bash

set -o xtrace  # trace what gets executed
set -o nounset # exit when your script tries to use undeclared variables

__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

pushd "$__dir" > /dev/null 2>&1

GALAXY="$(command -v ansible-galaxy)"
if test $? -eq 1 ; then
  echo "missing ansible... please install it and re-run"
  echo "brew install homebrew/versions/ansible19"
  exit 1
fi

"$GALAXY" install -r ./ansible/galaxy.yml -p ./ansible/roles
if $?; then
  packer build -var "aws_access_key=$AWS_ACCESS_KEY" -var "aws_secret_key=$AWS_SECRET_KEY" Packerfile
else
  echo "the role installation failed"
  exit 1
fi

if $?; then
  echo "packer build completed"
else
  echo "packer build failed"
  exit 1
fi

popd > /dev/null 2>&1

