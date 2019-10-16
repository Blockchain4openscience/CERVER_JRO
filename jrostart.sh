composer card create -p connection.json -u PeerAdmin -c Admin@org1.example.com-cert.pem -k 114aab0e76bf0c78308f89efc4b8c9423e31568da0c340ca187a9b17aa9a4457_sk -r PeerAdmin -r ChannelAdmin
composer card import -f PeerAdmin@fabric-network.card
composer network install -c PeerAdmin@fabric-network -a jro@0.1.1.bna
composer network start --networkName jro --networkVersion 0.1.1 -A admin -S adminpw -c PeerAdmin@fabric-network
composer card import -f admin@jro.card
composer-rest-server  -c admin@jro -n never -w true -p 3000