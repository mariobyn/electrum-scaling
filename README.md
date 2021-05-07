### Electrum wallet load balancer

We can use multiple wallets that connect to a private electrumx server (see electrumx folder to publish the electrumx server on another server). You can publish electrumx to a private EC2 and just connect it into the cluster on deployment.yaml {{ELECTRUM_PRIVATE_SERVER}} as 10.0.0.0:50002:S (for example)
