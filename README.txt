REMIX DEFAULT WORKSPACE

Remix default workspace is present when:
i. Remix loads for the very first time 
ii. A new workspace is created
iii. There are no files existing in the File Explorer

This workspace contains 3 directories:

1. 'contracts': Holds three contracts with different complexity level, denoted with number prefix in file name.
2. 'scripts': Holds two scripts to deploy a contract. It is explained below.
3. 'tests': Contains one Solidity test file for 'Ballot' contract & one JS test file for 'Storage' contract

SCRIPTS

The 'scripts' folder contains two example async/await scripts for deploying the 'Storage' contract.
For the deployment of any other contract, 'contractName' and 'constructorArgs' should be updated (along with other code if required). 

Also, there is a script containing some unit tests for Storage contract inside tests directory.

To run a script, right click on file name in the file explorer and click 'Run'. Remember, Solidity file must already be compiled.
Output from script will appear in remix terminal.

Please note, 'require' statement is supported in a limited manner for Remix supported modules.
For now, modules supported by Remix are ethers, web3, swarmgw, chai, remix and hardhat only for hardhat.ethers object/plugin.
For unsupported modules, an error like this will be thrown: '<module_name> module require is not supported by Remix IDE will be shown.'
===
# Add networks to metamask
https://chainlist.org/
## Price feed info
https://docs.chain.link/docs/ethereum-addresses/

# Notes
Every Function call has a value "wei" "gwei" assoc. It basically states how much eth you are going to send.
1 Wei is the smallest amount of eth.

# Centralized ORacles are point of failure
Decentralize your computation
data.chain.link

## Decimals
decimals don't work in solidity
2802.05998248 * 10 ** 8

## Type casting is simple, just wrap It
int256 to 256 by doing uint256(answer);

## How to add a revert 
require(getConversionRate(msg.value) >= minimumUSD, "You need to spend more ETH!, it should be more than 50");
Use the modifier for withdrawing!     modifier onlyOwner {

 
