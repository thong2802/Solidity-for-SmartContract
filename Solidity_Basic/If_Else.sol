// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract IfElse {
    function foo(uint x) public pure returns(uint) {
        if(x < 10) {
            return 1;
        }else if(x < 20) {
            return 2;
        }else {
            return 3;
        }
    }
    function ternary(uint x) public pure return(uint) {
        // if(x < 10) {
        //     return 1;
        // }else {
        //     return 2;
        // }
        // shorthand way to write if/else statement
        // the "?" operator is called the ternary operater
        return x < 10 ? 1 : 2;
    }
}