//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Greeter {
    mapping(address => uint256) public accountBalance;

    receive() external payable {
        accountBalance[msg.sender] += msg.value;
    }

    function getAccountBalance(address accountAddress)
        external
        payable
        returns (uint256)
    {
        return accountBalance[accountAddress];
    }
}
