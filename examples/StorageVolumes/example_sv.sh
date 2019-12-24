#! /bin/bash

if [ $# -ne 3 ]; then
    echo "not the right amount of args"
    echo "usage: source example_sv.sh [hostIP] [username] [password]"
    return 1
fi

echo "Begging Quatastor Storage Volume setup example"

python3 vol_setup.py $1 $2 $3

echo "Created Storage Volume: 'testVol'"

echo "Created Host: 'testHost'"

echo "Attached ACL between 'testHost' & 'testVol'"

iqnout=$( sudo qs-util iscsiiqn | cat )

iqn=$(echo $iqnout | cut -d ' ' -f 4-)

echo "iqn = $iqn"

python3 acl_attach.py $1 $iqn $2 $3

echo "logging host into ISCSI Block Storage"

sudo qs-util iscsilogin $1

return 0
