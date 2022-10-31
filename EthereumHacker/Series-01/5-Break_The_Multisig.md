Challenge 5 - Break the Multisig

This challenge requires use of an external contract to interact with multiple contracts.
- We need to create our own ERC20 token for malicious use.
- We need to ensure our contract address is an Oracle in the CBDC contract.
- Then we can make our contract the CentralBank of the MultiSig contract
- Once we're the CentralBank we can change which CBDC contract the Multisig contract is dealing with
- Then we need to approve transfer of ERC20 from our malicious contract to multisig contract, this step is required due to Multisig using transferFrom() in the buyFundsPublic() function.
- buyFundsPublic is then run to transfer ERC20 from our malicious contract for 1 CBDC  
- Then we call transfer() from CBDC to wallet address

To do this we create our main contract as as ERC20 then load interfaces for CBDC and MultiSig to interact with them.

From here we call the hack, running through the procedural list of actions achieving the goal of the challenge.

Send a message to the chat window, click send and the task is complete.