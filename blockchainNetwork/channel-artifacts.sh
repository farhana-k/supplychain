# Genesis Block
configtxgen -profile RaftOrderer -channelID test-sys-channel -outputBlock ./channel-artifacts/genesis.block

#Channel

configtxgen -profile common -outputCreateChannelTx ./channel-artifacts/common.tx -channelID common

#Anchor Peer of Org1

configtxgen -profile common -outputAnchorPeersUpdate ./channel-artifacts/org1AnchorPeer.tx -channelID common -asOrg org1MSP

#Anchor peer of Org2

configtxgen -profile common -outputAnchorPeersUpdate ./channel-artifacts/org2AnchorPeer.tx -channelID common -asOrg org2MSP

#Anchor peer of Org3

configtxgen -profile common -outputAnchorPeersUpdate ./channel-artifacts/org3AnchorPeer.tx -channelID common -asOrg org3MSP


##############################

#channel a & b
configtxgen -profile channela -outputCreateChannelTx ./channel-artifacts/channela.tx -channelID channela
configtxgen -profile channelb -outputCreateChannelTx ./channel-artifacts/channelb.tx -channelID channelb


#Anchor peer Org1
configtxgen -profile channela -outputAnchorPeersUpdate ./channel-artifacts/org1AnchorPeerchannela.tx -channelID channela -asOrg org1MSP

#Anchor peer Org2
configtxgen -profile channela -outputAnchorPeersUpdate ./channel-artifacts/org2AnchorPeerchannela.tx -channelID channela -asOrg org2MSP
configtxgen -profile channelb -outputAnchorPeersUpdate ./channel-artifacts/org2AnchorPeerchannelb.tx -channelID channela -asOrg org2MSP


#Anchor peer Org3
configtxgen -profile channelb -outputAnchorPeersUpdate ./channel-artifacts/org3AnchorPeerchannelb.tx -channelID channelb -asOrg org3MSP

