#!/bin/bash

echo "***************** Fetch Channel Block ***************"
peer channel fetch 0 channelb.block -c channelb -o orderer1.orderer.test.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/orderer/tls/tlsca.orderer.test.com-cert.pem


echo "***************** peer0 - Join channelb Channel ***************"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/users/Admin@org3.test.com/msp CORE_PEER_ADDRESS=peer0.org3.test.com:7051 CORE_PEER_LOCALMSPID="org3MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/peers/peer0.org3.test.com/tls/ca.crt 
peer channel join -b channelb.block

echo "***************** Update Anchor Peer ***************"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/users/Admin@org3.test.com/msp CORE_PEER_ADDRESS=peer0.org3.test.com:7051 CORE_PEER_LOCALMSPID="org3MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/peers/peer0.org3.test.com/tls/ca.crt 
peer channel update -o orderer1.orderer.test.com:7050 -c channelb -f ./channel/org3AnchorPeerchannelb.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/orderer/tls/tlsca.orderer.test.com-cert.pem


echo "***************** peer1 - Join channelb Channel ***************"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/users/Admin@org3.test.com/msp CORE_PEER_ADDRESS=peer1.org3.test.com:7051 CORE_PEER_LOCALMSPID="org3MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/peers/peer1.org3.test.com/tls/ca.crt 
peer channel join -b channelb.block
