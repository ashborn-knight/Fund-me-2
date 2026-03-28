// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.18;

import {AggregatorV3Interface} from  "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol"

contract FundMe {

    uint256 public minimumUsd = 5;

//function takes and checks to see if sender sneds amount greater than the amount specified

    function fund() public payable {
        require(msg.value >= minimumUsd,"didnt send enough ETH");//1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18


    }

    function getPrice() public{
        //Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        //ABI 
  
    }

    function getConversionRate() public{

    }

    function getVersion() public view returns(uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();

    }
    
    }


}
