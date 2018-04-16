 /*
  * Copyright 2018 Eligma Ltd.
  * Licensed under the Apache License, Version 2.0 (the "License").
  * You may not use this file except in compliance with the License.
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
   limitations under the License.
  */


pragma solidity ^0.4.21;

import "./Utils/Owned.sol";
import "./Interfaces/ERC20TokenInterface.sol";
import "./Interfaces/MintableTokenInterface.sol";

contract EligmaMintingContract is Owned{

    address public crowdsaleContractAddress;
    address public tokenContractAddress;
    uint public tokenTotalSupply;

    event MintMade(address _to, uint _tokensMinted, string _message);

    function EligmaMintingContract(uint _tokenTotalSupply) public {
        tokenTotalSupply = _tokenTotalSupply;
    }

    function doPresaleMinting(address _destination, uint _tokensAmount) public onlyOwner {
        require(ERC20TokenInterface(tokenContractAddress).totalSupply() + _tokensAmount <= tokenTotalSupply);
        MintableTokenInterface(tokenContractAddress).mint(_destination, _tokensAmount);
        emit MintMade(_destination, _tokensAmount, "Presale mint");
    }

    function doCrowdsaleMinting(address _destination, uint _tokensAmount) public {
        require(msg.sender == crowdsaleContractAddress);
        require(ERC20TokenInterface(tokenContractAddress).totalSupply() + _tokensAmount <= tokenTotalSupply);
        MintableTokenInterface(tokenContractAddress).mint(_destination, _tokensAmount);
        emit MintMade(_destination, _tokensAmount, "Crowdsale mint");
    }

    function doTeamMinting(address _destination) public onlyOwner {
        require(ERC20TokenInterface(tokenContractAddress).totalSupply() < tokenTotalSupply);
        uint amountToMint = tokenTotalSupply - ERC20TokenInterface(tokenContractAddress).totalSupply();
        MintableTokenInterface(tokenContractAddress).mint(_destination, amountToMint);
        emit MintMade(_destination, amountToMint, "Team mint");
    }

    function setTokenContractAddress(address _newAddress) public onlyOwner {
        tokenContractAddress = _newAddress;
    }

    function setCrowdsaleContractAddress(address _newAddress) public onlyOwner {
        crowdsaleContractAddress = _newAddress;
    }

    function killContract() public onlyOwner {
        selfdestruct(owner);
    }
}