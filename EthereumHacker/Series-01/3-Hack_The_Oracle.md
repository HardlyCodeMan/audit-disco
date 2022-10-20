Challenge 3 - Hack the Oracle

While we can (and did) write an external contract to interact with the CDBC contract, this challenge requires out wallet address to be in the Oracles list to pass the challenge so we will utilise the contract is verified on [etherscan](https://goerli.etherscan.io/) and interact with it from there. It is also possible to load the main contract into Remix and load it's published address to interact with it that way.

In the codebase there is a link to a twitter account. The account has posted somewhat of a riddle "" the answer being a bank. Checking the answer to the riddle with the testAnswer() function we can compare hashes to ensure we have the correct answer.

From here we call the addOracle() function with the answer to our riddle, which will add us to the Oracles list, achieving the goal of the challenge.

Send a message to the chat window, click send and the task is complete.