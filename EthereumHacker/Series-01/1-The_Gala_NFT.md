Challenge 1 - The Gala NFT

The NFT contract has an unprotected public function increaseMaxSupply() that we can use to exploit the contract to get ourselves an NFT.

```solidity    
    function increaseMaxSupply() public {
        _maxSupply += 1;
    }
```
To exploit this you can check to see if the contract is verified on [etherscan](https://goerli.etherscan.io/) and interact with it from there. In this case though as we're working on the testnets, I'll write and deploy a contract to complete this exploitation.

The exploit contract loads the NFT contract by address, then in the hack() function we call the increaseMaxSupply() function to allow us room in the max supply so we may then run the mint() function to mint us the fresh new NFT allocation.

Paste the wallet address into the chat window, click send and the task is complete.