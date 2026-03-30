// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5 * 1e18;

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

//function takes and checks to see if sender sneds amount greater than the amount specified

    function fund() public payable {
        
        require(msg.value.getConversionRate() >= minimumUsd,"didnt send enough ETH");//1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;




    }


    function withdraw() public{
        //for loop
        //for(starting index,stopping index,step amount)
        
    }

    
}


