#! /bin/sh

[ ! -f /config/headphones/headphones.ini ] && cat <<EOF > /config/headphones/headphones.ini
[General]
http_host = 0.0.0.0
EOF

python2.7 /headphones/Headphones.py --datadir=/config/headphones --config=/config/headphones/headphones.ini
