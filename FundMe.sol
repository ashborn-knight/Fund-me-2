// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.18;

contract FundMe {

    uint256 public minimumUsd = 5;

//function takes and checks to see if sender sneds amount greater than the amount specified

    function fund() public payable {
        require(msg.value >= minimumUsd,"didnt send enough ETH");//1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18


    }

    function getPrice() public{
        //Address 
  
    }

    function getConversionRate() public{

    }
    
    }


}
