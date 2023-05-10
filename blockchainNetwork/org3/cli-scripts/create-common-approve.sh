#!/bin/bash
            
echo "***************** queryinstalled Jam chaincode ***************"
                    CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/users/Admin@org3.test.com/msp CORE_PEER_ADDRESS=peer0.org3.test.com:7051 CORE_PEER_LOCALMSPID="org3MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/peers/peer0.org3.test.com/tls/ca.crt 
                    peer lifecycle chaincode queryinstalled >&log.txt
                    { set +x; } 2>/dev/null
                    cat log.txt
                    PACKAGE_ID=$(sed -n "/Jam_1.0/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
                    
echo "***************** ApproveforMyOrg Jam chaincode ***************"
                    CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/users/Admin@org3.test.com/msp CORE_PEER_ADDRESS=peer0.org3.test.com:7051 CORE_PEER_LOCALMSPID="org3MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/peers/peer0.org3.test.com/tls/ca.crt 
                    peer lifecycle chaincode approveformyorg -o orderer1.orderer.test.com:7050 --ordererTLSHostnameOverride orderer1.orderer.test.com --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/orderer/tls/tlsca.orderer.test.com-cert.pem --channelID channelb --name Jam --version 1.0 --package-id $PACKAGE_ID --sequence 1    --signature-policy "OR('org1MSP.peer','org2MSP.peer','org3MSP.peer')"
                    
echo "***************** checkCommitReadiness Jam chaincode ***************"
                    CORE_PEER_MSPCONFIGPATH=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/users/Admin@org3.test.com/msp CORE_PEER_ADDRESS=peer0.org3.test.com:7051 CORE_PEER_LOCALMSPID="org3MSP" CORE_PEER_TLS_ROOTCERT_FILE=/opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org3.test.com/peers/peer0.org3.test.com/tls/ca.crt 
                    peer lifecycle chaincode checkcommitreadiness --channelID channelb --name Jam --version 1.0 --sequence 1    --signature-policy "OR('org1MSP.peer','org2MSP.peer','org3MSP.peer')"
