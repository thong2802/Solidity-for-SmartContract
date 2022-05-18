// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Variable in Solidity have three types; 
// or There are three of Variables in Solidty;
/*
+ Local
    - declared inside a Funtion
    - not stored on the blockchain
+ State
    - declered outside a function
    - stored on the blockchain
+ Global
    - provides information about the blockchain

*/

contract Variable {
    // State variables are stored on the blockchain
    string public text = "Hello";
    uint public num = 123;

    function doSomeThing() public {
        // Local variables are not stored on the blockchain

        uint i = 10;


        // here are some global variable provides information about the blockchain
        uint timestamp = block.timestamp; // current block stamp
        address sender = msg.sender; // address of the called.

    }
}