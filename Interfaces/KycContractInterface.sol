pragma solidity ^0.4.21;

contract KycContractInterface {
    function isAddressVerified(address _address) public view returns (bool);
}