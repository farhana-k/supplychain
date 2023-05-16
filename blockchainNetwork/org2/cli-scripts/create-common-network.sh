#!/bin/bash
echo "***************** Fetch Channel Block ***************"
peer channel fetch 0 channela.block -c channela -o orderer1.orderer.test.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/orderer/tls/tlsca.orderer.test.com-cert.pem
peer channel fetch 0 channelb.block -c channelb -o orderer1.orderer.test.com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/orderer/tls/tlsca.orderer.test.com-cert.pem


echo "***************** peer0 - Join channela Channel ***************"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.test.com/users/Admin@org2.test.com/msp CORE_PEER_ADDRESS=peer0.org2.test.com:7051 CORE_PEER_LOCALMSPID="org2MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.test.com/peers/peer0.org2.test.com/tls/ca.crt 
peer channel join -b channela.block

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.test.com/users/Admin@org2.test.com/msp CORE_PEER_ADDRESS=peer0.org2.test.com:7051 CORE_PEER_LOCALMSPID="org2MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.test.com/peers/peer0.org2.test.com/tls/ca.crt 
peer channel join -b channelb.block

echo "***************** Update Anchor Peer ***************"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.test.com/users/Admin@org2.test.com/msp CORE_PEER_ADDRESS=peer0.org2.test.com:7051 CORE_PEER_LOCALMSPID="org2MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.test.com/peers/peer0.org2.test.com/tls/ca.crt 
peer channel update -o orderer1.orderer.test.com:7050 -c channela -f ./channel/org2AnchorPeerchannela.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/orderer/tls/tlsca.orderer.test.com-cert.pem

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.test.com/users/Admin@org2.test.com/msp CORE_PEER_ADDRESS=peer0.org2.test.com:7051 CORE_PEER_LOCALMSPID="org2MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.test.com/peers/peer0.org2.test.com/tls/ca.crt 
peer channel update -o orderer1.orderer.test.com:7050 -c channelb -f ./channel/org2AnchorPeerchannelb.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/orderer/tls/tlsca.orderer.test.com-cert.pem


echo "***************** peer1 - Join channela Channel ***************"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.test.com/users/Admin@org2.test.com/msp CORE_PEER_ADDRESS=peer1.org2.test.com:7051 CORE_PEER_LOCALMSPID="org2MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.test.com/peers/peer1.org2.test.com/tls/ca.crt 
peer channel join -b channela.block

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.test.com/users/Admin@org2.test.com/msp CORE_PEER_ADDRESS=peer1.org2.test.com:7051 CORE_PEER_LOCALMSPID="org2MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org2.test.com/peers/peer1.org2.test.com/tls/ca.crt 
peer channel join -b channelb.block




echo "***************** Fetch Channel Block ***************"


echo "***************** peer0 - Join channelb Channel ***************"



echo "***************** Update Anchor Peer ***************"


echo "***************** peer1 - Join channelb Channel ***************"
