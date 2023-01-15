#!/usr/bin/env bash

# the following commands come from:
# https://stackoverflow.com/questions/67343804/error-ssl-certificate-doesnt-exist-home-rsvay-snap-barrier-kvm-2-local-shar

ssl_dir="${HOME}/.local/share/barrier/SSL"
mkdir -pv "${ssl_dir}"
pushd "${ssl_dir}" || exit
mkdir -p Fingerprints
openssl req -x509 -nodes -days 365 -subj /CN=barrier -newkey rsa:4096 -keyout Barrier.pem -out Barrier.pem
openssl x509 -fingerprint -sha1 -noout -in Barrier.pem >Fingerprints/Local.txt
sed -e "s/.*=//" -i Fingerprints/Local.txt

popd || exit
