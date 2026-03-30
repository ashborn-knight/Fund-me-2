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
        addressToAmountFunded[msg.sender] +=  msg.value;




    }


    function withdraw() public{
        //for loop
        //for(starting index,stopping index,step amount)
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++ ){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        //reset the array
        //withdraw the funds
        funders = new address[](0);

        //now withdrawing
        //transfer
        //payable(msg.sender) data type type casted to payable
        payable(msg.sender).transfer(address(this).balance);
        //send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess,"Send failed");

        //call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance }("");
        require(callSuccess,"Call failed");






    }

    
}


