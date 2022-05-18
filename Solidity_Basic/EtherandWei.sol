/*
Transactions are paid with ether.

Similar to how one dollar is equal to 100 cent, one ether is equal to 1018 wei.
*/ 
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EtherUnit {
    uint public oneWei = 1 wei;
    // 1 wei is equal to 1;
    bool public isOnewei = 1 wei == 1;

    uint public oneTher = 1 ether;
    bool public isOneTher = 1 ether == 1e18;
}
