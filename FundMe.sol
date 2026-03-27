// SPDX-License-Identifier: MIT

pragma solidity ^ 0.8.18;

contract FundMe {

//function takes and checks to see if sender sneds amount greater than the amount specified

    function fund() public payable {
        require(msg.value > 1e18,"didnt send enough ETH");//1e18 = 1 ETH = 1000000000000000000 = 1 * 10 ** 18


    }

    function withdraw() public{

    }

}
