// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// inhert simple storage without copying code
import "./SimpleStorage.sol";

contract StorageFactory is
    SimpleStorage // inheritance without manually creating instances etc!
{
    //expose this publicly to see the values
    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public {
        // create instance for simple storage and add the contract add
        // to the array
        // deploy contract that you imported
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber)
        public
    {
        // address
        // ABI application binary interface
        SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(
            _simpleStorageNumber
        );
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        return
            SimpleStorage(address(simpleStorageArray[_simpleStorageIndex]))
                .retrieve();
    }
}
