# Genesis Block
configtxgen -profile RaftOrderer -channelID test-sys-channel -outputBlock ./channel-artifacts/genesis.block

#Channel

configtxgen -profile ChannelA -outputCreateChannelTx ./channel-artifacts/channela.tx -channelID channela
configtxgen -profile ChannelB -outputCreateChannelTx ./channel-artifacts/channelb.tx -channelID channelb

#Anchor Peer of Org1


configtxgen -profile ChannelA -outputAnchorPeersUpdate ./channel-artifacts/org1AnchorPeer.tx -channelID channela -asOrg org1MSP

#Anchor peer of Org2

configtxgen -profile ChannelA -outputAnchorPeersUpdate ./channel-artifacts/org2AnchorPeerchannelA.tx -channelID channela -asOrg org2MSP
configtxgen -profile ChannelB -outputAnchorPeersUpdate ./channel-artifacts/org2AnchorPeerchannelB.tx -channelID channelb -asOrg org2MSP

#Anchor peer of Org3

configtxgen -profile ChannelB -outputAnchorPeersUpdate ./channel-artifacts/org3AnchorPeer.tx -channelID channelb -asOrg org3MSP