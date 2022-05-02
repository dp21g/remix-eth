// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    // map of address to amount funded
    // once funded this contract now owns the amount of eth of gwei
    mapping(address => uint256) public addressToAmountFunded; 
    address public owner;

    constructor() {
        // on creation of the contract deployment - set the owner
        owner = msg.sender;
    }

    // displays a red button to pay
    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
        // what the ETH -> USd conversion rate
        uint256 minimumUSD = 1 * 10 ** 18;
        // check if the value is more then $50 to succeed
        require(getConversionRate(msg.value) >= minimumUSD, "You need to spend more ETH!, it should be more than $1");

    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        // accessed the functions within the imported interfaces
        return priceFeed.version();
    }

    function getPrice() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        /*
        returns (
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound)
        */
        (,int256 answer,,,) = priceFeed.latestRoundData();
        return uint256(answer * 10000000000);
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsed = (ethPrice * ethAmount / 1000000000000000000);
        return ethAmountInUsed; //input 1000000000 = 2806478592440 output
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only the owner can withdraw mate!");
        _;
    }

    function withdraw() onlyOwner payable public {
        // https://eth-converter.com/
        //0.0005 eth = 1.3982249999999998 USD = 500000 GWEI
        payable(msg.sender).transfer(address(this).balance);
    }
}