Challenge 4 - Market Manipulation

This challenge requires use of an external contract for the blockHash input variable of the updatePrice() function. Fortunately the hack() function written in the hack contract for the previous challenge has a call to updatePrice() we just need to modify the price to the one requested in the challenge.

From here we call the hack, adding us to the oracle list and changing the price of HSD for the CBDC achieving the goal of the challenge.

Send a message to the chat window, click send and the task is complete.