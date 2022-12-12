Summary
 - [arbitrary-send](#arbitrary-send) (1 results) (High)
 - [controlled-delegatecall](#controlled-delegatecall) (1 results) (High)
 - [reentrancy-eth](#reentrancy-eth) (1 results) (High)
 - [unprotected-upgrade](#unprotected-upgrade) (1 results) (High)
 - [uninitialized-local](#uninitialized-local) (9 results) (Medium)
 - [unused-return](#unused-return) (11 results) (Medium)
 - [missing-zero-check](#missing-zero-check) (2 results) (Low)
 - [variable-scope](#variable-scope) (8 results) (Low)
 - [reentrancy-events](#reentrancy-events) (2 results) (Low)
 - [timestamp](#timestamp) (2 results) (Low)
 - [assembly](#assembly) (17 results) (Informational)
 - [boolean-equal](#boolean-equal) (5 results) (Informational)
 - [pragma](#pragma) (1 results) (Informational)
 - [solc-version](#solc-version) (52 results) (Informational)
 - [low-level-calls](#low-level-calls) (8 results) (Informational)
 - [naming-convention](#naming-convention) (29 results) (Informational)
 - [reentrancy-unlimited-gas](#reentrancy-unlimited-gas) (1 results) (Informational)
 - [unused-state](#unused-state) (1 results) (Informational)
 - [external-function](#external-function) (31 results) (Optimization)
## arbitrary-send
Impact: High
Confidence: Medium
 - [ ] ID-0
[BlurExchange._transferTo(address,address,address,uint256)](contracts/BlurExchange.sol#L486-L509) sends eth to arbitrary user
	Dangerous calls:
	- [address(to).transfer(amount)](contracts/BlurExchange.sol#L498-L499)

contracts/BlurExchange.sol#L486-L509


## controlled-delegatecall
Impact: High
Confidence: Medium
 - [ ] ID-1
[ERC1967UpgradeUpgradeable._functionDelegateCall(address,bytes)](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L198-L204) uses delegatecall to a input-controlled function id
	- [(success,returndata) = target.delegatecall(data)](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L202)

node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L198-L204


## reentrancy-eth
Impact: High
Confidence: Medium
 - [ ] ID-2
Reentrancy in [BlurExchange.execute(Input,Input)](contracts/BlurExchange.sol#L124-L168):
	External calls:
	- [_executeFundsTransfer(sell.order.trader,buy.order.trader,sell.order.paymentToken,sell.order.fees,price)](contracts/BlurExchange.sol#L143-L145)
		- [executionDelegate.transferERC20(weth,from,to,amount)](contracts/BlurExchange.sol#L504-L507)
	- [_executeTokenTransfer(sell.order.collection,sell.order.trader,buy.order.trader,tokenId,amount,assetType)](contracts/BlurExchange.sol#L145-L153)
		- [executionDelegate.transferERC721(collection,from,to,tokenId)](contracts/BlurExchange.sol#L531-L533)
		- [executionDelegate.transferERC1155(collection,from,to,tokenId,amount)](contracts/BlurExchange.sol#L534-L537)
	External calls sending eth:
	- [_executeFundsTransfer(sell.order.trader,buy.order.trader,sell.order.paymentToken,sell.order.fees,price)](contracts/BlurExchange.sol#L143-L145)
		- [address(to).transfer(amount)](contracts/BlurExchange.sol#L498-L499)
	State variables written after the call(s):
	- [cancelledOrFilled[sellHash] = true](contracts/BlurExchange.sol#L155-L156)
	- [cancelledOrFilled[buyHash] = true](contracts/BlurExchange.sol#L156-L157)

contracts/BlurExchange.sol#L124-L168


## unprotected-upgrade
Impact: High
Confidence: High
 - [ ] ID-3
[TestBlurExchange](contracts/test/TestBlurExchange.sol#L7-L31) is an upgradeable contract that does not protect its initiliaze functions: [BlurExchange.initialize(uint256,address,IExecutionDelegate,IPolicyManager,address,uint256)](contracts/BlurExchange.sol#L88-L110)[IBlurExchange.initialize(uint256,address,IExecutionDelegate,IPolicyManager,address,uint256)](contracts/interfaces/IBlurExchange.sol#L14-L21). Anyone can delete the contract with: [UUPSUpgradeable.upgradeTo(address)](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L72-L75)[UUPSUpgradeable.upgradeToAndCall(address,bytes)](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L85-L88)
contracts/test/TestBlurExchange.sol#L7-L31


## uninitialized-local
Impact: Medium
Confidence: Medium
 - [ ] ID-4
[BlurExchange._validateOracleAuthorization(bytes32,SignatureVersion,bytes,uint256).s](contracts/BlurExchange.sol#L377) is a local variable never initialized

contracts/BlurExchange.sol#L377


 - [ ] ID-5
[ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes).response](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L445) is a local variable never initialized

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L445


 - [ ] ID-6
[BlurExchange._validateOracleAuthorization(bytes32,SignatureVersion,bytes,uint256).r](contracts/BlurExchange.sol#L377) is a local variable never initialized

contracts/BlurExchange.sol#L377


 - [ ] ID-7
[BlurExchange._validateOracleAuthorization(bytes32,SignatureVersion,bytes,uint256).v](contracts/BlurExchange.sol#L376-L377) is a local variable never initialized

contracts/BlurExchange.sol#L376-L377


 - [ ] ID-8
[ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes).reason](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L427) is a local variable never initialized

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L427


 - [ ] ID-9
[BlurExchange._validateUserAuthorization(bytes32,address,uint8,bytes32,bytes32,SignatureVersion,bytes).hashToSign](contracts/BlurExchange.sol#L345) is a local variable never initialized

contracts/BlurExchange.sol#L345


 - [ ] ID-10
[ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes).reason](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L450) is a local variable never initialized

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L450


 - [ ] ID-11
[ERC1967UpgradeUpgradeable._upgradeToAndCallUUPS(address,bytes,bool).slot](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L98) is a local variable never initialized

node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L98


 - [ ] ID-12
[ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes).response](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L423) is a local variable never initialized

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L423


## unused-return
Impact: Medium
Confidence: Medium
 - [ ] ID-13
[PolicyManager.addPolicy(address)](contracts/PolicyManager.sol#L25-L30) ignores return value by [_whitelistedPolicies.add(policy)](contracts/PolicyManager.sol#L27)

contracts/PolicyManager.sol#L25-L30


 - [ ] ID-14
[ERC1967Upgrade._upgradeToAndCallSecure(address,bytes,bool)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L80-L108) ignores return value by [Address.functionDelegateCall(newImplementation,abi.encodeWithSignature(upgradeTo(address),oldImplementation))](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L98-L101)

node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L80-L108


 - [ ] ID-15
[ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L435-L456) ignores return value by [IERC1155Receiver(to).onERC1155BatchReceived(operator,from,ids,amounts,data)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L444-L454)

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L435-L456


 - [ ] ID-16
[ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L414-L433) ignores return value by [IERC1155Receiver(to).onERC1155Received(operator,from,id,amount,data)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L423-L431)

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L414-L433


 - [ ] ID-17
[ERC1967Upgrade._upgradeBeaconToAndCall(address,bytes,bool)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L183-L193) ignores return value by [Address.functionDelegateCall(IBeacon(newBeacon).implementation(),data)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L191)

node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L183-L193


 - [ ] ID-18
[BlurExchange._transferTo(address,address,address,uint256)](contracts/BlurExchange.sol#L486-L509) ignores return value by [executionDelegate.transferERC20(weth,from,to,amount)](contracts/BlurExchange.sol#L504-L507)

contracts/BlurExchange.sol#L486-L509


 - [ ] ID-19
[ERC1967UpgradeUpgradeable._upgradeToAndCallUUPS(address,bytes,bool)](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L87-L105) ignores return value by [IERC1822ProxiableUpgradeable(newImplementation).proxiableUUID()](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L98-L102)

node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L87-L105


 - [ ] ID-20
[ERC721._checkOnERC721Received(address,address,uint256,bytes)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L382-L403) ignores return value by [IERC721Receiver(to).onERC721Received(_msgSender(),from,tokenId,_data)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L389-L399)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L382-L403


 - [ ] ID-21
[ERC1967Upgrade._upgradeToAndCallSecure(address,bytes,bool)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L80-L108) ignores return value by [Address.functionDelegateCall(newImplementation,data)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L90)

node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L80-L108


 - [ ] ID-22
[PolicyManager.removePolicy(address)](contracts/PolicyManager.sol#L36-L41) ignores return value by [_whitelistedPolicies.remove(policy)](contracts/PolicyManager.sol#L38)

contracts/PolicyManager.sol#L36-L41


 - [ ] ID-23
[ERC1967Upgrade._upgradeToAndCall(address,bytes,bool)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L64-L73) ignores return value by [Address.functionDelegateCall(newImplementation,data)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L71)

node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L64-L73


## missing-zero-check
Impact: Low
Confidence: Medium
 - [ ] ID-24
[BlurExchange.initialize(uint256,address,IExecutionDelegate,IPolicyManager,address,uint256)._weth](contracts/BlurExchange.sol#L89) lacks a zero-check on :
		- [weth = _weth](contracts/BlurExchange.sol#L106)

contracts/BlurExchange.sol#L89


 - [ ] ID-25
[BlurExchange.initialize(uint256,address,IExecutionDelegate,IPolicyManager,address,uint256)._oracle](contracts/BlurExchange.sol#L91-L94) lacks a zero-check on :
		- [oracle = _oracle](contracts/BlurExchange.sol#L109)

contracts/BlurExchange.sol#L91-L94


## variable-scope
Impact: Low
Confidence: High
 - [ ] ID-26
Variable '[ERC1967UpgradeUpgradeable._upgradeToAndCallUUPS(address,bytes,bool).slot](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L98)' in [ERC1967UpgradeUpgradeable._upgradeToAndCallUUPS(address,bytes,bool)](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L87-L105) potentially used before declaration: [require(bool,string)(slot == _IMPLEMENTATION_SLOT,ERC1967Upgrade: unsupported proxiableUUID)](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L99)

node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L98


 - [ ] ID-27
Variable '[ERC721._checkOnERC721Received(address,address,uint256,bytes).reason](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L391)' in [ERC721._checkOnERC721Received(address,address,uint256,bytes)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L382-L403) potentially used before declaration: [revert(uint256,uint256)(32 + reason,mload(uint256)(reason))](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L396)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L391


 - [ ] ID-28
Variable '[ERC721._checkOnERC721Received(address,address,uint256,bytes).reason](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L391)' in [ERC721._checkOnERC721Received(address,address,uint256,bytes)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L382-L403) potentially used before declaration: [reason.length == 0](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L392)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L391


 - [ ] ID-29
Variable '[ERC721._checkOnERC721Received(address,address,uint256,bytes).retval](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L389)' in [ERC721._checkOnERC721Received(address,address,uint256,bytes)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L382-L403) potentially used before declaration: [retval == IERC721Receiver.onERC721Received.selector](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L390)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L389


 - [ ] ID-30
Variable '[ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes).response](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L445)' in [ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L435-L456) potentially used before declaration: [response != IERC1155Receiver.onERC1155BatchReceived.selector](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L447)

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L445


 - [ ] ID-31
Variable '[ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes).reason](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L450)' in [ERC1155._doSafeBatchTransferAcceptanceCheck(address,address,address,uint256[],uint256[],bytes)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L435-L456) potentially used before declaration: [revert(string)(reason)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L451)

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L450


 - [ ] ID-32
Variable '[ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes).response](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L423)' in [ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L414-L433) potentially used before declaration: [response != IERC1155Receiver.onERC1155Received.selector](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L424)

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L423


 - [ ] ID-33
Variable '[ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes).reason](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L427)' in [ERC1155._doSafeTransferAcceptanceCheck(address,address,address,uint256,uint256,bytes)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L414-L433) potentially used before declaration: [revert(string)(reason)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L428)

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L427


## reentrancy-events
Impact: Low
Confidence: Medium
 - [ ] ID-34
Reentrancy in [BlurExchange.execute(Input,Input)](contracts/BlurExchange.sol#L124-L168):
	External calls:
	- [_executeFundsTransfer(sell.order.trader,buy.order.trader,sell.order.paymentToken,sell.order.fees,price)](contracts/BlurExchange.sol#L143-L145)
		- [executionDelegate.transferERC20(weth,from,to,amount)](contracts/BlurExchange.sol#L504-L507)
	- [_executeTokenTransfer(sell.order.collection,sell.order.trader,buy.order.trader,tokenId,amount,assetType)](contracts/BlurExchange.sol#L145-L153)
		- [executionDelegate.transferERC721(collection,from,to,tokenId)](contracts/BlurExchange.sol#L531-L533)
		- [executionDelegate.transferERC1155(collection,from,to,tokenId,amount)](contracts/BlurExchange.sol#L534-L537)
	External calls sending eth:
	- [_executeFundsTransfer(sell.order.trader,buy.order.trader,sell.order.paymentToken,sell.order.fees,price)](contracts/BlurExchange.sol#L143-L145)
		- [address(to).transfer(amount)](contracts/BlurExchange.sol#L498-L499)
	Event emitted after the call(s):
	- [OrdersMatched(sell.order.trader,sell.order.trader,sell.order,sellHash,buy.order,buyHash)](contracts/BlurExchange.sol#L158-L168)
	- [OrdersMatched(buy.order.trader,buy.order.trader,sell.order,sellHash,buy.order,buyHash)](contracts/BlurExchange.sol#L158-L168)

contracts/BlurExchange.sol#L124-L168


 - [ ] ID-35
Reentrancy in [ERC1967Upgrade._upgradeToAndCallSecure(address,bytes,bool)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L80-L108):
	External calls:
	- [Address.functionDelegateCall(newImplementation,data)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L90)
	- [Address.functionDelegateCall(newImplementation,abi.encodeWithSignature(upgradeTo(address),oldImplementation))](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L98-L101)
	Event emitted after the call(s):
	- [Upgraded(newImplementation)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L56)
		- [_upgradeTo(newImplementation)](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L106)

node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L80-L108


## timestamp
Impact: Low
Confidence: Medium
 - [ ] ID-36
[BlurExchange._canSettleOrder(uint256,uint256)](contracts/BlurExchange.sol#L269-L278) uses timestamp for comparisons
	Dangerous comparisons:
	- [(listingTime < block.timestamp) && (expirationTime == 0 || block.timestamp < expirationTime)](contracts/BlurExchange.sol#L275-L278)

contracts/BlurExchange.sol#L269-L278


 - [ ] ID-37
[BlurExchange._validateOrderParameters(Order,bytes32)](contracts/BlurExchange.sol#L246-L266) uses timestamp for comparisons
	Dangerous comparisons:
	- [((order.trader != address(0)) && (cancelledOrFilled[orderHash] == false) && _canSettleOrder(order.listingTime,order.expirationTime))](contracts/BlurExchange.sol#L254-L266)

contracts/BlurExchange.sol#L246-L266


## assembly
Impact: Informational
Confidence: High
 - [ ] ID-38
[MerkleVerifier._efficientHash(bytes32,bytes32)](contracts/lib/MerkleVerifier.sol#L46-L56) uses assembly
	- [INLINE ASM](contracts/lib/MerkleVerifier.sol#L52-L56)

contracts/lib/MerkleVerifier.sol#L46-L56


 - [ ] ID-39
[StorageSlotUpgradeable.getAddressSlot(bytes32)](node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L52-L57) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L54-L56)

node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L52-L57


 - [ ] ID-40
[StorageSlot.getBytes32Slot(bytes32)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L70-L74) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L71-L73)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L70-L74


 - [ ] ID-41
[StorageSlot.getUint256Slot(bytes32)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L79-L83) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L80-L82)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L79-L83


 - [ ] ID-42
[StorageSlotUpgradeable.getBytes32Slot(bytes32)](node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L72-L77) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L74-L76)

node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L72-L77


 - [ ] ID-43
[StorageSlotUpgradeable.getBooleanSlot(bytes32)](node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L62-L67) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L64-L66)

node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L62-L67


 - [ ] ID-44
[StorageSlot.getAddressSlot(bytes32)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L52-L56) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L53-L55)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L52-L56


 - [ ] ID-45
[Address.isContract(address)](node_modules/@openzeppelin/contracts/utils/Address.sol#L27-L37) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Address.sol#L33-L35)

node_modules/@openzeppelin/contracts/utils/Address.sol#L27-L37


 - [ ] ID-46
[BlurExchange._exists(address)](contracts/BlurExchange.sol#L539-L546) uses assembly
	- [INLINE ASM](contracts/BlurExchange.sol#L541-L545)

contracts/BlurExchange.sol#L539-L546


 - [ ] ID-47
[EnumerableSet.values(EnumerableSet.AddressSet)](node_modules/@openzeppelin/contracts/utils/structs/EnumerableSet.sol#L274-L283) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/structs/EnumerableSet.sol#L278-L280)

node_modules/@openzeppelin/contracts/utils/structs/EnumerableSet.sol#L274-L283


 - [ ] ID-48
[ERC721._checkOnERC721Received(address,address,uint256,bytes)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L382-L403) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L395-L397)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L382-L403


 - [ ] ID-49
[StorageSlot.getBooleanSlot(bytes32)](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L61-L65) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L62-L64)

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L61-L65


 - [ ] ID-50
[EnumerableSet.values(EnumerableSet.UintSet)](node_modules/@openzeppelin/contracts/utils/structs/EnumerableSet.sol#L347-L356) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/structs/EnumerableSet.sol#L351-L353)

node_modules/@openzeppelin/contracts/utils/structs/EnumerableSet.sol#L347-L356


 - [ ] ID-51
[Address.verifyCallResult(bool,bytes,string)](node_modules/@openzeppelin/contracts/utils/Address.sol#L196-L216) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/utils/Address.sol#L208-L211)

node_modules/@openzeppelin/contracts/utils/Address.sol#L196-L216


 - [ ] ID-52
[StorageSlotUpgradeable.getUint256Slot(bytes32)](node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L82-L87) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L84-L86)

node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L82-L87


 - [ ] ID-53
[AddressUpgradeable.verifyCallResult(bool,bytes,string)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L174-L194) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L186-L189)

node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L174-L194


 - [ ] ID-54
[Proxy._delegate(address)](node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L22-L45) uses assembly
	- [INLINE ASM](node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L23-L44)

node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L22-L45


## boolean-equal
Impact: Informational
Confidence: High
 - [ ] ID-55
[ExecutionDelegate.transferERC1155(address,address,address,uint256,uint256)](contracts/ExecutionDelegate.sol#L104-L110) compares to a boolean constant:
	-[require(bool,string)(revokedApproval[from] == false,User has revoked approval)](contracts/ExecutionDelegate.sol#L108)

contracts/ExecutionDelegate.sol#L104-L110


 - [ ] ID-56
[ExecutionDelegate.transferERC721(address,address,address,uint256)](contracts/ExecutionDelegate.sol#L88-L94) compares to a boolean constant:
	-[require(bool,string)(revokedApproval[from] == false,User has revoked approval)](contracts/ExecutionDelegate.sol#L92)

contracts/ExecutionDelegate.sol#L88-L94


 - [ ] ID-57
[ExecutionDelegate.transferERC20(address,address,address,uint256)](contracts/ExecutionDelegate.sol#L119-L126) compares to a boolean constant:
	-[require(bool,string)(revokedApproval[from] == false,User has revoked approval)](contracts/ExecutionDelegate.sol#L124)

contracts/ExecutionDelegate.sol#L119-L126


 - [ ] ID-58
[BlurExchange._validateOrderParameters(Order,bytes32)](contracts/BlurExchange.sol#L246-L266) compares to a boolean constant:
	-[((order.trader != address(0)) && (cancelledOrFilled[orderHash] == false) && _canSettleOrder(order.listingTime,order.expirationTime))](contracts/BlurExchange.sol#L254-L266)

contracts/BlurExchange.sol#L246-L266


 - [ ] ID-59
[ExecutionDelegate.transferERC721Unsafe(address,address,address,uint256)](contracts/ExecutionDelegate.sol#L73-L79) compares to a boolean constant:
	-[require(bool,string)(revokedApproval[from] == false,User has revoked approval)](contracts/ExecutionDelegate.sol#L77)

contracts/ExecutionDelegate.sol#L73-L79


## pragma
Impact: Informational
Confidence: High
 - [ ] ID-60
Different versions of Solidity are used:
	- Version used: ['0.8.13', '^0.8.0', '^0.8.1', '^0.8.2']
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/interfaces/draft-IERC1822Upgradeable.sol#L4)
	- [^0.8.2](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/proxy/beacon/IBeaconUpgradeable.sol#L4)
	- [^0.8.2](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L4)
	- [^0.8.1](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/access/Ownable.sol#L4)
	- [^0.8.2](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/proxy/beacon/IBeacon.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC1155/IERC1155.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC1155/extensions/IERC1155MetadataURI.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/IERC721.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/Address.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/Context.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/Strings.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/introspection/ERC165.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/introspection/IERC165.sol#L4)
	- [^0.8.0](node_modules/@openzeppelin/contracts/utils/structs/EnumerableSet.sol#L4)
	- [0.8.13](contracts/BlurExchange.sol#L2)
	- [v2](contracts/BlurExchange.sol#L3)
	- [0.8.13](contracts/ExecutionDelegate.sol#L2)
	- [v2](contracts/ExecutionDelegate.sol#L3)
	- [0.8.13](contracts/PolicyManager.sol#L2)
	- [0.8.13](contracts/interfaces/IBlurExchange.sol#L2)
	- [v2](contracts/interfaces/IBlurExchange.sol#L3)
	- [0.8.13](contracts/interfaces/IExecutionDelegate.sol#L2)
	- [0.8.13](contracts/interfaces/IMatchingPolicy.sol#L2)
	- [0.8.13](contracts/interfaces/IPolicyManager.sol#L2)
	- [0.8.13](contracts/lib/EIP712.sol#L2)
	- [0.8.13](contracts/lib/ERC1967Proxy.sol#L3)
	- [0.8.13](contracts/lib/MerkleVerifier.sol#L2)
	- [0.8.13](contracts/lib/OrderStructs.sol#L2)
	- [0.8.13](contracts/lib/ReentrancyGuarded.sol#L2)
	- [0.8.13](contracts/matchingPolicies/StandardPolicyERC1155.sol#L2)
	- [0.8.13](contracts/matchingPolicies/StandardPolicyERC721.sol#L2)
	- [0.8.13](contracts/mocks/MockERC1155.sol#L1)
	- [0.8.13](contracts/mocks/MockERC20.sol#L1)
	- [0.8.13](contracts/mocks/MockERC721.sol#L1)
	- [0.8.13](contracts/test/TestBlurExchange.sol#L2)
	- [v2](contracts/test/TestBlurExchange.sol#L3)

node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L4


## solc-version
Impact: Informational
Confidence: High
 - [ ] ID-61
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol#L4


 - [ ] ID-62
Pragma version[0.8.13](contracts/lib/EIP712.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/lib/EIP712.sol#L2


 - [ ] ID-63
Pragma version[0.8.13](contracts/matchingPolicies/StandardPolicyERC721.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/matchingPolicies/StandardPolicyERC721.sol#L2


 - [ ] ID-64
Pragma version[0.8.13](contracts/interfaces/IBlurExchange.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/interfaces/IBlurExchange.sol#L2


 - [ ] ID-65
Pragma version[0.8.13](contracts/PolicyManager.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/PolicyManager.sol#L2


 - [ ] ID-66
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/Context.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/Context.sol#L4


 - [ ] ID-67
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/proxy/Proxy.sol#L4


 - [ ] ID-68
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/proxy/beacon/IBeacon.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/proxy/beacon/IBeacon.sol#L4


 - [ ] ID-69
Pragma version[0.8.13](contracts/mocks/MockERC721.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/mocks/MockERC721.sol#L1


 - [ ] ID-70
Pragma version[0.8.13](contracts/lib/ERC1967Proxy.sol#L3) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/lib/ERC1967Proxy.sol#L3


 - [ ] ID-71
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/Strings.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/Strings.sol#L4


 - [ ] ID-72
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/structs/EnumerableSet.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/structs/EnumerableSet.sol#L4


 - [ ] ID-73
Pragma version[0.8.13](contracts/BlurExchange.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/BlurExchange.sol#L2


 - [ ] ID-74
Pragma version[0.8.13](contracts/mocks/MockERC20.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/mocks/MockERC20.sol#L1


 - [ ] ID-75
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC1155/IERC1155Receiver.sol#L4


 - [ ] ID-76
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/utils/StorageSlotUpgradeable.sol#L4


 - [ ] ID-77
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol#L4


 - [ ] ID-78
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L4


 - [ ] ID-79
Pragma version[0.8.13](contracts/ExecutionDelegate.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/ExecutionDelegate.sol#L2


 - [ ] ID-80
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC1155/extensions/IERC1155MetadataURI.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC1155/extensions/IERC1155MetadataURI.sol#L4


 - [ ] ID-81
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L4


 - [ ] ID-82
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L4


 - [ ] ID-83
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC721/extensions/IERC721Metadata.sol#L4


 - [ ] ID-84
Pragma version[0.8.13](contracts/interfaces/IPolicyManager.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/interfaces/IPolicyManager.sol#L2


 - [ ] ID-85
Pragma version[0.8.13](contracts/test/TestBlurExchange.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/test/TestBlurExchange.sol#L2


 - [ ] ID-86
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC20/IERC20.sol#L4


 - [ ] ID-87
Pragma version[0.8.13](contracts/lib/MerkleVerifier.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/lib/MerkleVerifier.sol#L2


 - [ ] ID-88
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/introspection/ERC165.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/introspection/ERC165.sol#L4


 - [ ] ID-89
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L4


 - [ ] ID-90
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/proxy/beacon/IBeaconUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/proxy/beacon/IBeaconUpgradeable.sol#L4


 - [ ] ID-91
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol#L4


 - [ ] ID-92
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/StorageSlot.sol#L4


 - [ ] ID-93
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/IERC721.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC721/IERC721.sol#L4


 - [ ] ID-94
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/Address.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/Address.sol#L4


 - [ ] ID-95
solc-0.8.13 is not recommended for deployment

 - [ ] ID-96
Pragma version[0.8.13](contracts/interfaces/IMatchingPolicy.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/interfaces/IMatchingPolicy.sol#L2


 - [ ] ID-97
Pragma version[^0.8.2](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L4


 - [ ] ID-98
Pragma version[0.8.13](contracts/interfaces/IExecutionDelegate.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/interfaces/IExecutionDelegate.sol#L2


 - [ ] ID-99
Pragma version[0.8.13](contracts/mocks/MockERC1155.sol#L1) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/mocks/MockERC1155.sol#L1


 - [ ] ID-100
Pragma version[^0.8.2](node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Upgrade.sol#L4


 - [ ] ID-101
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol#L4


 - [ ] ID-102
Pragma version[0.8.13](contracts/lib/ReentrancyGuarded.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/lib/ReentrancyGuarded.sol#L2


 - [ ] ID-103
Pragma version[0.8.13](contracts/matchingPolicies/StandardPolicyERC1155.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/matchingPolicies/StandardPolicyERC1155.sol#L2


 - [ ] ID-104
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/access/Ownable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/access/Ownable.sol#L4


 - [ ] ID-105
Pragma version[^0.8.2](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol#L4


 - [ ] ID-106
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/utils/introspection/IERC165.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/utils/introspection/IERC165.sol#L4


 - [ ] ID-107
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L4


 - [ ] ID-108
Pragma version[^0.8.1](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L4


 - [ ] ID-109
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L4


 - [ ] ID-110
Pragma version[0.8.13](contracts/lib/OrderStructs.sol#L2) necessitates a version too recent to be trusted. Consider deploying with 0.6.12/0.7.6/0.8.7

contracts/lib/OrderStructs.sol#L2


 - [ ] ID-111
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts-upgradeable/interfaces/draft-IERC1822Upgradeable.sol#L4) allows old versions

node_modules/@openzeppelin/contracts-upgradeable/interfaces/draft-IERC1822Upgradeable.sol#L4


 - [ ] ID-112
Pragma version[^0.8.0](node_modules/@openzeppelin/contracts/token/ERC1155/IERC1155.sol#L4) allows old versions

node_modules/@openzeppelin/contracts/token/ERC1155/IERC1155.sol#L4


## low-level-calls
Impact: Informational
Confidence: High
 - [ ] ID-113
Low level call in [AddressUpgradeable.functionCallWithValue(address,bytes,uint256,string)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L128-L139):
	- [(success,returndata) = target.call{value: value}(data)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L137)

node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L128-L139


 - [ ] ID-114
Low level call in [AddressUpgradeable.sendValue(address,uint256)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L60-L65):
	- [(success) = recipient.call{value: amount}()](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L63)

node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L60-L65


 - [ ] ID-115
Low level call in [Address.functionStaticCall(address,bytes,string)](node_modules/@openzeppelin/contracts/utils/Address.sol#L152-L161):
	- [(success,returndata) = target.staticcall(data)](node_modules/@openzeppelin/contracts/utils/Address.sol#L159)

node_modules/@openzeppelin/contracts/utils/Address.sol#L152-L161


 - [ ] ID-116
Low level call in [Address.sendValue(address,uint256)](node_modules/@openzeppelin/contracts/utils/Address.sol#L55-L60):
	- [(success) = recipient.call{value: amount}()](node_modules/@openzeppelin/contracts/utils/Address.sol#L58)

node_modules/@openzeppelin/contracts/utils/Address.sol#L55-L60


 - [ ] ID-117
Low level call in [AddressUpgradeable.functionStaticCall(address,bytes,string)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L157-L166):
	- [(success,returndata) = target.staticcall(data)](node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L164)

node_modules/@openzeppelin/contracts-upgradeable/utils/AddressUpgradeable.sol#L157-L166


 - [ ] ID-118
Low level call in [Address.functionDelegateCall(address,bytes,string)](node_modules/@openzeppelin/contracts/utils/Address.sol#L179-L188):
	- [(success,returndata) = target.delegatecall(data)](node_modules/@openzeppelin/contracts/utils/Address.sol#L186)

node_modules/@openzeppelin/contracts/utils/Address.sol#L179-L188


 - [ ] ID-119
Low level call in [ERC1967UpgradeUpgradeable._functionDelegateCall(address,bytes)](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L198-L204):
	- [(success,returndata) = target.delegatecall(data)](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L202)

node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L198-L204


 - [ ] ID-120
Low level call in [Address.functionCallWithValue(address,bytes,uint256,string)](node_modules/@openzeppelin/contracts/utils/Address.sol#L123-L134):
	- [(success,returndata) = target.call{value: value}(data)](node_modules/@openzeppelin/contracts/utils/Address.sol#L132)

node_modules/@openzeppelin/contracts/utils/Address.sol#L123-L134


## naming-convention
Impact: Informational
Confidence: High
 - [ ] ID-121
Parameter [BlurExchange.initialize(uint256,address,IExecutionDelegate,IPolicyManager,address,uint256)._executionDelegate](contracts/BlurExchange.sol#L89-L90) is not in mixedCase

contracts/BlurExchange.sol#L89-L90


 - [ ] ID-122
Function [ERC1967UpgradeUpgradeable.__ERC1967Upgrade_init_unchained()](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L24-L25) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L24-L25


 - [ ] ID-123
Variable [ContextUpgradeable.__gap](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L36) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L36


 - [ ] ID-124
Parameter [BlurExchange.initialize(uint256,address,IExecutionDelegate,IPolicyManager,address,uint256)._blockRange](contracts/BlurExchange.sol#L94-L95) is not in mixedCase

contracts/BlurExchange.sol#L94-L95


 - [ ] ID-125
Parameter [ERC721.safeTransferFrom(address,address,uint256,bytes)._data](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L179) is not in mixedCase

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L179


 - [ ] ID-126
Function [OwnableUpgradeable.__Ownable_init()](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L29-L31) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L29-L31


 - [ ] ID-127
Parameter [BlurExchange.initialize(uint256,address,IExecutionDelegate,IPolicyManager,address,uint256)._weth](contracts/BlurExchange.sol#L89) is not in mixedCase

contracts/BlurExchange.sol#L89


 - [ ] ID-128
Variable [OwnableUpgradeable.__gap](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L94) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L94


 - [ ] ID-129
Constant [BlurExchange.version](contracts/BlurExchange.sol#L52-L53) is not in UPPER_CASE_WITH_UNDERSCORES

contracts/BlurExchange.sol#L52-L53


 - [ ] ID-130
Variable [UUPSUpgradeable.__gap](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L107) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L107


 - [ ] ID-131
Variable [ERC1967UpgradeUpgradeable.__gap](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L211) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L211


 - [ ] ID-132
Function [ContextUpgradeable.__Context_init_unchained()](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L21-L22) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L21-L22


 - [ ] ID-133
Function [UUPSUpgradeable.__UUPSUpgradeable_init_unchained()](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L26-L27) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L26-L27


 - [ ] ID-134
Parameter [BlurExchange.setBlockRange(uint256)._blockRange](contracts/BlurExchange.sol#L233) is not in mixedCase

contracts/BlurExchange.sol#L233


 - [ ] ID-135
Parameter [BlurExchange.setPolicyManager(IPolicyManager)._policyManager](contracts/BlurExchange.sol#L218-L219) is not in mixedCase

contracts/BlurExchange.sol#L218-L219


 - [ ] ID-136
Parameter [ExecutionDelegate.approveContract(address)._contract](contracts/ExecutionDelegate.sol#L36) is not in mixedCase

contracts/ExecutionDelegate.sol#L36


 - [ ] ID-137
Parameter [BlurExchange.initialize(uint256,address,IExecutionDelegate,IPolicyManager,address,uint256)._oracle](contracts/BlurExchange.sol#L91-L94) is not in mixedCase

contracts/BlurExchange.sol#L91-L94


 - [ ] ID-138
Parameter [BlurExchange.initialize(uint256,address,IExecutionDelegate,IPolicyManager,address,uint256)._policyManager](contracts/BlurExchange.sol#L91) is not in mixedCase

contracts/BlurExchange.sol#L91


 - [ ] ID-139
Parameter [BlurExchange.setOracle(address)._oracle](contracts/BlurExchange.sol#L225-L226) is not in mixedCase

contracts/BlurExchange.sol#L225-L226


 - [ ] ID-140
Parameter [BlurExchange.setExecutionDelegate(IExecutionDelegate)._executionDelegate](contracts/BlurExchange.sol#L205-L207) is not in mixedCase

contracts/BlurExchange.sol#L205-L207


 - [ ] ID-141
Function [MerkleVerifier._computeRoot(bytes32,bytes32[])](contracts/lib/MerkleVerifier.sol#L33-L42) is not in mixedCase

contracts/lib/MerkleVerifier.sol#L33-L42


 - [ ] ID-142
Function [OwnableUpgradeable.__Ownable_init_unchained()](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L33-L35) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L33-L35


 - [ ] ID-143
Variable [UUPSUpgradeable.__self](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L29) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L29


 - [ ] ID-144
Function [ERC1967UpgradeUpgradeable.__ERC1967Upgrade_init()](node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L21-L22) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/proxy/ERC1967/ERC1967UpgradeUpgradeable.sol#L21-L22


 - [ ] ID-145
Function [UUPSUpgradeable.__UUPSUpgradeable_init()](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L23-L24) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L23-L24


 - [ ] ID-146
Variable [EIP712.DOMAIN_SEPARATOR](contracts/lib/EIP712.sol#L37) is not in mixedCase

contracts/lib/EIP712.sol#L37


 - [ ] ID-147
Parameter [ExecutionDelegate.denyContract(address)._contract](contracts/ExecutionDelegate.sol#L45) is not in mixedCase

contracts/ExecutionDelegate.sol#L45


 - [ ] ID-148
Function [ContextUpgradeable.__Context_init()](node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L18-L19) is not in mixedCase

node_modules/@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol#L18-L19


 - [ ] ID-149
Function [MerkleVerifier._verifyProof(bytes32,bytes32,bytes32[])](contracts/lib/MerkleVerifier.sol#L17-L26) is not in mixedCase

contracts/lib/MerkleVerifier.sol#L17-L26


## reentrancy-unlimited-gas
Impact: Informational
Confidence: Medium
 - [ ] ID-150
Reentrancy in [BlurExchange.execute(Input,Input)](contracts/BlurExchange.sol#L124-L168):
	External calls:
	- [_executeFundsTransfer(sell.order.trader,buy.order.trader,sell.order.paymentToken,sell.order.fees,price)](contracts/BlurExchange.sol#L143-L145)
		- [address(to).transfer(amount)](contracts/BlurExchange.sol#L498-L499)
	State variables written after the call(s):
	- [cancelledOrFilled[sellHash] = true](contracts/BlurExchange.sol#L155-L156)
	- [cancelledOrFilled[buyHash] = true](contracts/BlurExchange.sol#L156-L157)
	Event emitted after the call(s):
	- [OrdersMatched(sell.order.trader,sell.order.trader,sell.order,sellHash,buy.order,buyHash)](contracts/BlurExchange.sol#L158-L168)
	- [OrdersMatched(buy.order.trader,buy.order.trader,sell.order,sellHash,buy.order,buyHash)](contracts/BlurExchange.sol#L158-L168)

contracts/BlurExchange.sol#L124-L168


## unused-state
Impact: Informational
Confidence: High
 - [ ] ID-151
[UUPSUpgradeable.__gap](node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L107) is never used in [TestBlurExchange](contracts/test/TestBlurExchange.sol#L7-L31)

node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol#L107


## external-function
Impact: Optimization
Confidence: High
 - [ ] ID-152
transferFrom(address,address,uint256) should be declared external:
	- [ERC20.transferFrom(address,address,uint256)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L150-L164)

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L150-L164


 - [ ] ID-153
symbol() should be declared external:
	- [ERC721.symbol()](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L86-L88)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L86-L88


 - [ ] ID-154
uri(uint256) should be declared external:
	- [ERC1155.uri(uint256)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L59-L61)

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L59-L61


 - [ ] ID-155
transferOwnership(address) should be declared external:
	- [OwnableUpgradeable.transferOwnership(address)](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L74-L77)

node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L74-L77


 - [ ] ID-156
renounceOwnership() should be declared external:
	- [Ownable.renounceOwnership()](node_modules/@openzeppelin/contracts/access/Ownable.sol#L54-L56)

node_modules/@openzeppelin/contracts/access/Ownable.sol#L54-L56


 - [ ] ID-157
tokenURI(uint256) should be declared external:
	- [ERC721.tokenURI(uint256)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L93-L98)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L93-L98


 - [ ] ID-158
safeTransferFrom(address,address,uint256,uint256,bytes) should be declared external:
	- [ERC1155.safeTransferFrom(address,address,uint256,uint256,bytes)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L117-L129)

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L117-L129


 - [ ] ID-159
safeBatchTransferFrom(address,address,uint256[],uint256[],bytes) should be declared external:
	- [ERC1155.safeBatchTransferFrom(address,address,uint256[],uint256[],bytes)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L134-L146)

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L134-L146


 - [ ] ID-160
safeTransferFrom(address,address,uint256) should be declared external:
	- [ERC721.safeTransferFrom(address,address,uint256)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L164-L170)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L164-L170


 - [ ] ID-161
tokenOfOwnerByIndex(address,uint256) should be declared external:
	- [ERC721Enumerable.tokenOfOwnerByIndex(address,uint256)](node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol#L37-L40)

node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol#L37-L40


 - [ ] ID-162
decimals() should be declared external:
	- [ERC20.decimals()](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L87-L89)

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L87-L89


 - [ ] ID-163
decreaseAllowance(address,uint256) should be declared external:
	- [ERC20.decreaseAllowance(address,uint256)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L197-L205)

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L197-L205


 - [ ] ID-164
tokenByIndex(uint256) should be declared external:
	- [ERC721Enumerable.tokenByIndex(uint256)](node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol#L52-L55)

node_modules/@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol#L52-L55


 - [ ] ID-165
symbol() should be declared external:
	- [ERC20.symbol()](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L70-L72)

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L70-L72


 - [ ] ID-166
balanceOf(address) should be declared external:
	- [ERC20.balanceOf(address)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L101-L103)

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L101-L103


 - [ ] ID-167
transfer(address,uint256) should be declared external:
	- [ERC20.transfer(address,uint256)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L113-L116)

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L113-L116


 - [ ] ID-168
increaseAllowance(address,uint256) should be declared external:
	- [ERC20.increaseAllowance(address,uint256)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L178-L181)

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L178-L181


 - [ ] ID-169
transferFrom(address,address,uint256) should be declared external:
	- [ERC721.transferFrom(address,address,uint256)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L150-L159)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L150-L159


 - [ ] ID-170
approve(address,uint256) should be declared external:
	- [ERC721.approve(address,uint256)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L112-L122)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L112-L122


 - [ ] ID-171
transferOwnership(address) should be declared external:
	- [Ownable.transferOwnership(address)](node_modules/@openzeppelin/contracts/access/Ownable.sol#L62-L65)

node_modules/@openzeppelin/contracts/access/Ownable.sol#L62-L65


 - [ ] ID-172
name() should be declared external:
	- [ERC20.name()](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L62-L64)

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L62-L64


 - [ ] ID-173
renounceOwnership() should be declared external:
	- [OwnableUpgradeable.renounceOwnership()](node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L66-L68)

node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol#L66-L68


 - [ ] ID-174
_verifyProof(bytes32,bytes32,bytes32[]) should be declared external:
	- [MerkleVerifier._verifyProof(bytes32,bytes32,bytes32[])](contracts/lib/MerkleVerifier.sol#L17-L26)

contracts/lib/MerkleVerifier.sol#L17-L26


 - [ ] ID-175
name() should be declared external:
	- [ERC721.name()](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L79-L81)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L79-L81


 - [ ] ID-176
balanceOfBatch(address[],uint256[]) should be declared external:
	- [ERC1155.balanceOfBatch(address[],uint256[])](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L82-L98)

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L82-L98


 - [ ] ID-177
setApprovalForAll(address,bool) should be declared external:
	- [ERC1155.setApprovalForAll(address,bool)](node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L103-L105)

node_modules/@openzeppelin/contracts/token/ERC1155/ERC1155.sol#L103-L105


 - [ ] ID-178
totalSupply() should be declared external:
	- [ERC20.totalSupply()](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L94-L96)

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L94-L96


 - [ ] ID-179
approve(address,uint256) should be declared external:
	- [ERC20.approve(address,uint256)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L132-L135)

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L132-L135


 - [ ] ID-180
initialize(uint256,address,IExecutionDelegate,IPolicyManager,address,uint256) should be declared external:
	- [BlurExchange.initialize(uint256,address,IExecutionDelegate,IPolicyManager,address,uint256)](contracts/BlurExchange.sol#L88-L110)

contracts/BlurExchange.sol#L88-L110


 - [ ] ID-181
setApprovalForAll(address,bool) should be declared external:
	- [ERC721.setApprovalForAll(address,bool)](node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L136-L138)

node_modules/@openzeppelin/contracts/token/ERC721/ERC721.sol#L136-L138


 - [ ] ID-182
allowance(address,address) should be declared external:
	- [ERC20.allowance(address,address)](node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L121-L123)

node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol#L121-L123


