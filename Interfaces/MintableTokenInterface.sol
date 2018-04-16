pragma solidity ^0.4.21;

contract MintableTokenInterface {
    function mint(address _to, uint256 _amount) public;
}
