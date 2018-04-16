pragma solidity ^0.4.21;

contract MintingContractInterface {

    address public crowdsaleContractAddress;
    address public tokenContractAddress;
    uint public tokenTotalSupply;

    event MintMade(address _to, uint _ethAmount, uint _tokensMinted, string _message);

    function doPresaleMinting(address _destination, uint _tokensAmount) public;
    function doCrowdsaleMinting(address _destination, uint _tokensAmount) public;
    function doTeamMinting(address _destination) public;
    function setTokenContractAddress(address _newAddress) public;
    function setCrowdsaleContractAddress(address _newAddress) public;
    function killContract() public;
}