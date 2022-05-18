pragma solidity  >= 0.7.9 < 0.9.0;

contract Counter{
    uint public count;

    // This function will get current count
    function get() public view returns(uint) {
        return count;
    }
    // this function will increment count by 1;
    function inc() public{
        count += 1;
    }
    // this function will decrement count by 1;
    function dec() public {
        // this funtion will return fail if count == 0;
        count -= 1;
    }
}