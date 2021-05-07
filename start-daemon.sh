#!/bin/bash
echo 'setting rpc configuration'
echo $NETWORK
/usr/local/bin/electrum $NETWORK --offline setconfig rpcport $RPC_PORT
/usr/local/bin/electrum $NETWORK --offline setconfig rpcuser $1
/usr/local/bin/electrum $NETWORK --offline setconfig rpcpassword $2
/usr/local/bin/electrum $NETWORK --offline setconfig log_to_file true
echo 'starting daemon'
/usr/local/bin/electrum $NETWORK daemon $ELECTRUM_SERVER

