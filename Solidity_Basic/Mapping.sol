/*
Maps are created with the syntax mapping(keyType => valueType).

The keyType can be any built-in value type, bytes, string, or any contract.

valueType can be any type including another mapping or an array.

Mappings are not iterable.

*/
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Mapping {
      // Mapping from address to uint
      mapping(address => uint) public myMap;

      function get(address _address) public view returns(uint) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
          return myMap[_address];
      }

      function set(address _addr, uint _i) public {
           // Update the value at this address
            myMap[_addr] = _i;
      }

      function remove(address _addr) public {
          delete myMap[_addr];
      }
}

 // NestMapping
contract NestMapping {
        // Nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint => bool)) public  nested;

    function get(address _addr, uint _i) public view returns(bool) {
        // you can get values from a nested mapping onother.
        // even when it is not intialized.
        return nested[_addr][_i];
    }

    function set(
        address _addres,
        uint _i,
        bool _bool
    ) public {
        nested[_addres][_i] = _bool; 
    }

    function remove(address _addr, uint _i) public {
        delete nested[_addr][_i];
    }
}