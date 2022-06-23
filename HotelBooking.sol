// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelBooking {
    enum Statuses {
        Vacant,
        Occupied
    }

    Statuses public currentStatus;

    event Occupy(address _occupant,uint256 _value);

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant() {
        require(currentStatus == Statuses.Vacant, "Currently not vacant");
        _;
    }

    modifier costs(uint256 _amount){
require(msg.value >= _amount, "Not enough Eth to Occupy");
_;
    }

    function book() public payable onlyWhileVacant costs(2 ether){
        
        currentStatus = Statuses.Occupied;

(bool sent,bytes memory data)=owner.call{value:msg.value}("");
// (bool sent,bytes memory data)=owner.call{value: msg.value}{""};
require(sent);

        emit Occupy(msg.sender, msg.value);
    }
}
