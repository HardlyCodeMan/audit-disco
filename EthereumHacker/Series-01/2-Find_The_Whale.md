Challenge 2 - Find The Whale

Much like the first challenge we can utilise the contract is verified on [etherscan](https://goerli.etherscan.io/) and interact with it from there. In this case though as we're working on the testnets, I'll write and deploy a contract to complete this exploitation.

The exploit contract loads the NFT contract by address, then in the hack() function we call the ownerOf() function (a standard function of ERC721 tokens) to return the address of the Whale.

Paste the wallet address into the chat window, click send and the task is complete.