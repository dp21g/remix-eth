pragma solidity >=0.8.0 <0.9.0;

// SPDX-License-Identifier: MIT

contract SimpleStorage {
    uint256 public favNumber; // 0 by default
    // int
    // bool favBool = true;
    // string favString = "string";
    // int256 favInt = -5
    // address favAdd = 0xc9A8a2b01b950166DE68E79eAb99377e0636234B;
    // bytes32 favBytes = "Cat"

    // public - all can access
    // external - Cannot be accessed internally, only externally
    // internal - only this contract and contracts deriving from it can access
    // private - can be accessed only from this contrac

    struct People {
        uint256 favNumber;
        string name;
    }

    // People public person = People({favNumber: 2, name: "ssddt"});
    People[] public people;
    mapping(string => uint256) public nameToFavNumber;

    function store(uint256 _favNumber) public {
        favNumber = _favNumber;
        uint256 test = 4;
    }

    //view pure //blue colour as they don't change state
    function retrieve() public view returns (uint256) {
        return favNumber;
    }

    //storing in memory means it will only stored during excution
    // storage will persist even after the execution
    function addPerson(string memory _name, uint256 _favNumber) public {
        people.push(People(favNumber, _name));
        nameToFavNumber[_name] = _favNumber;
    }

    /*
        Use Rinkby test network for testing. Fake money.
        EVM Etherium Virtual Machine
    */
}
