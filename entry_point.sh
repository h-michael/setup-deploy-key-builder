#!/bin/sh

git config --add --global url."git@github.com:".insteadOf https://github.com/
git config --add --global url."git@github.com:".insteadOf git://github.com/

if [ $# -ne 1 ]; then
  echo "one argument as 'secret name' must be given" 1>&2
  exit 1
fi

gcloud secrets versions access latest --secret="$1" > /root/.ssh/id_github

chmod 600 /root/.ssh/id_github
cat <<EOF >/root/.ssh/config
Hostname github.com
IdentityFile /root/.ssh/id_github
EOF

ssh-keyscan -t rsa github.com > /root/.ssh/known_hosts
