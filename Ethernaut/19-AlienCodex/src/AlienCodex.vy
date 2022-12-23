# https://goerli-optimism.etherscan.io/bytecode-decompiler?a=0xAF0047c50c8227C7300C8c266EB10B57F499b14f
# Palkeoramix decompiler. 

def storage:
  contact is uint8 at storage 0 offset 160
  owner is addr at storage 0
  codex is array of uint256 at storage 1

def contact() payable: 
  return bool(contact)

def owner() payable: 
  return owner

def codex(uint256 _param1) payable: 
  require calldata.size - 4 >= 32
  require _param1 < codex.length
  return codex[_param1]

#
#  Regular functions
#

def unknown58699c55() payable: 
  contact = 1

def _fallback() payable: # default function
  revert

def isOwner() payable: 
  return (caller == owner)

def record(bytes32 _param1) payable: 
  require calldata.size - 4 >= 32
  require contact
  codex.length++
  codex[codex.length] = _param1

def renounceOwnership() payable: 
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=0)
  owner = 0

def revise(uint256 _param1, bytes32 _param2) payable: 
  require calldata.size - 4 >= 64
  require contact
  require _param1 < codex.length
  codex[_param1] = _param2

def retract() payable: 
  require contact
  codex.length--
  if codex.length > codex.length - 1:
      idx = codex.length - 1
      while codex.length > idx:
          codex[idx] = 0
          idx = idx + 1
          continue 

def transferOwnership(address _newOwner) payable: 
  require calldata.size - 4 >= 32
  if owner != caller:
      revert with 0, 'Ownable: caller is not the owner'
  if not _newOwner:
      revert with 0x8c379a000000000000000000000000000000000000000000000000000000000, 
                  32,
                  38,
                  0xfe4f776e61626c653a206e6577206f776e657220697320746865207a65726f20616464726573,
                  mem[202 len 26]
  log OwnershipTransferred(
        address previousOwner=owner,
        address newOwner=_newOwner)
  owner = _newOwner


