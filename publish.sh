#!/bin/bash
echo "Checking master branch..."
if [[ "$TRAVIS_BRANCH" != "master" ]]; then echo "We're not on the master branch."; exit 0; fi
echo "Starting publish on ${SFTP_HOST}"
echo "${SFTP_PRIVATEKEY}" >/tmp/sftp_rsa
sed -i 's/NEWLINE/\n/g' /tmp/sftp_rsa
chmod 400 /tmp/sftp_rsa
echo "Uploading..."
scp -i /tmp/sftp_rsa index.html ${SFTP_USERNAME}@${SFTP_HOST}:/var/www/tomstein.me/index.html
ssh -i /tmp/sftp_rsa scholli@${SFTP_HOST} "rm -rf /var/www/tomstein.me/css"
scp -i /tmp/sftp_rsa -r css ${SFTP_USERNAME}@${SFTP_HOST}:/var/www/tomstein.me/css
ssh -i /tmp/sftp_rsa scholli@${SFTP_HOST} "rm -rf /var/www/tomstein.me/images"
scp -i /tmp/sftp_rsa -r images ${SFTP_USERNAME}@${SFTP_HOST}:/var/www/tomstein.me/images
ssh -i /tmp/sftp_rsa scholli@${SFTP_HOST} "rm -rf /var/www/tomstein.me/js"
scp -i /tmp/sftp_rsa -r js ${SFTP_USERNAME}@${SFTP_HOST}:/var/www/tomstein.me/js
ssh -i /tmp/sftp_rsa scholli@${SFTP_HOST} "rm -rf /var/www/tomstein.me/libs"
scp -i /tmp/sftp_rsa -r libs ${SFTP_USERNAME}@${SFTP_HOST}:/var/www/tomstein.me/libs
yes | rm /tmp/sftp_rsa
