![Ethernaut - Coin Flip!](https://ethernaut.openzeppelin.com/imgs/BigLevel3.svg)

## Ethernaut - 3 - CoinFlip

Generating random numbers in solidity can be tricky. There currently isn't a native way to generate them, and everything you use in smart contracts is publicly visible, including the local variables and state variables marked as private. Miners also have control over things like blockhashes, timestamps, and whether to include certain transactions - which allows them to bias these values in their favor.

To get cryptographically proven random numbers, you can use [Chainlink VRF](https://docs.chain.link/docs/get-a-random-number), which uses an oracle, the LINK token, and an on-chain contract to verify that the number is truly random.

Some other options include using Bitcoin block headers (verified through [BTC Relay](http://btcrelay.org/)), [RANDAO](https://github.com/randao/randao), or [Oraclize](http://www.oraclize.it/)).

### Solution
[Contracts](./03-CoinFlip/)

Click on "Get New Instance" to deploy the level contract on the Rinkeby network we may get started with the challenge.

This contract relies on a known number in uint256 FACTOR, and the previous block height uint256 blockValue = uint256(blockhash(block.number.sub(1))). Together these variables are used to calculate the coin flip outcome. We can game this by creating an Interface for the flip() function of the CoinFlip contract (ICoinFlip.sol) so we can call the function from out own contract (HackFlip.sol) in which we will game the system.

HackFlip.sol contains the bare logic essentials from the CoinFlip.sol contract for us to predetermine the outcome for the block in which the transaction is processed, and with our predetermined outcome we call the flip() function of the CoinFlip contract via the ICoinFlip interface which will be a correct guess each time incrementing the consecutiveWins value each time. Once consecutiveWins is 10 or more the challenge is completed.

Using Remix IDE:
- Publish ICoinFlip.sol and HackFlip.sol.
- Call setFlipContract() function of hackFlip.sol with the level contract address
- Call hack() enough times to complete the challenge (10 consecutive wins)

Check consecutiveWins with 
- contract.consecutiveWins()

Once consecutiveWins returns 10 or more, click the "Submit Instance" button and approve that transaction to complete the level.

✌(◕‿-)✌ Well done, You have completed this level!!!
