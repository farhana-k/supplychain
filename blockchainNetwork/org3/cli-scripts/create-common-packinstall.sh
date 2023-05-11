#!/bin/bash



echo "************ Package Pineapple chaincode **********" 
pushd /opt/gopath/src/github.com/chaincode/Pineapple/
GO111MODULE=on go mod vendor
popd

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/users/Admin@org3.test.com/msp CORE_PEER_ADDRESS=peer0.org3.test.com:7051 CORE_PEER_LOCALMSPID="org3MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/peers/peer0.org3.test.com/tls/ca.crt 
peer lifecycle chaincode package Pineapple.tar.gz --path /opt/gopath/src/github.com/chaincode/Pineapple/ --lang golang --label Pineapple_1.0

echo "***************** Install Pineapple chaincode ***************"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/users/Admin@org3.test.com/msp CORE_PEER_ADDRESS=peer0.org3.test.com:7051 CORE_PEER_LOCALMSPID="org3MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/peers/peer0.org3.test.com/tls/ca.crt 
peer lifecycle chaincode install Pineapple.tar.gz


echo "************ Package Jam chaincode **********" 
pushd /opt/gopath/src/github.com/chaincode/Jam/
GO111MODULE=on go mod vendor
popd

CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/users/Admin@org3.test.com/msp CORE_PEER_ADDRESS=peer0.org3.test.com:7051 CORE_PEER_LOCALMSPID="org3MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/peers/peer0.org3.test.com/tls/ca.crt 
peer lifecycle chaincode package Jam.tar.gz --path /opt/gopath/src/github.com/chaincode/Jam/ --lang golang --label Jam_1.0

echo "***************** Install Jam chaincode ***************"
CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/users/Admin@org3.test.com/msp CORE_PEER_ADDRESS=peer0.org3.test.com:7051 CORE_PEER_LOCALMSPID="org3MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/peers/peer0.org3.test.com/tls/ca.crt 
peer lifecycle chaincode install Jam.tar.gz
