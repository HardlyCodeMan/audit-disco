//SPDX-LICENSE-IDENTIFIER: UNLICENSED
pragma solidity 0.8.17;

import {IForta} from "./DoubleEntryPoint.sol";

contract DetectionBot {
    address private cryptoVault;

    struct CallData {
        bytes4 func;        // function name called (handleTransaction(address,bytes) = 0x220ab6aa)
        address sender;     // user calling
        uint256 offset;     // offset of msgData
        uint256 length;	    // length of msgData we want
        bytes4 checkFunc;   // delegateTransfer should be 0x9cd1a121
        address to;         // receiver
        uint256 value;	    // token amount
        address from;       // origal sender
        bytes28 padding;    // padding to fill 32-byte arguments rule of encoding bytes
    }

    constructor (address _cryptoVault) {
        cryptoVault = _cryptoVault;
    }

    // for fun, lets pull apart the call data into a struct
    function decompileData(bytes calldata msgData) internal returns (CallData memory) {
        CallData memory _data;
                       
        bytes4 _func;
        assembly { _func := calldataload(0x00) }
        _data.func = _func;

        address _sender;
        assembly { _sender := calldataload(0x04) }
        _data.sender = _sender;

        uint256 _offset;
        assembly { _offset := calldataload(0x24) }
        _data.offset = _offset;

        uint256 _length;
        assembly { _length := calldataload(0x44) }
        _data.length = _length;

        bytes4 _checkFunc;
        assembly { _checkFunc := calldataload(0x64) }
        _data.checkFunc = _checkFunc;

        address _to;
        assembly { _to := calldataload(0x68) }
        _data.to = _to;

        uint256 _value;
        assembly { _value := calldataload(0x88) }
        _data.value = _value;

        address _from;
        assembly { _from := calldataload(0xA8) }
        _data.from = _from;

        bytes28 _padding;
        assembly { _padding := calldataload(0xC8) }
        _data.padding = _padding;

        return _data;
    }

    function handleTransaction(address user, bytes calldata msgData) external {
        IForta forta = IForta(msg.sender);
        CallData memory _data = decompileData(msgData);

        // if issue found raise alert
        if (_data.from == address(cryptoVault)) {
            forta.raiseAlert(user);
        }
    }
}