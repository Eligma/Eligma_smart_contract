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

pragma solidity ^0.4.16;

import "./Utils/Owned.sol";
import "./Interfaces/ERC20TokenInterface.sol";

contract KycContract is Owned {
    
    mapping (address => bool) verifiedAddresses;

    function isAddressVerified(address _address) public view returns (bool) {
        return verifiedAddresses[_address];
    }
    
    function addAddress(address _newAddress) public onlyOwner {
        require(!verifiedAddresses[_newAddress]);
        
        verifiedAddresses[_newAddress] = true;
    }
    
    function removeAddress(address _oldAddress) public onlyOwner {
        require(verifiedAddresses[_oldAddress]);
        
        verifiedAddresses[_oldAddress] = false;
    }
    
    function batchAddAddresses(address[] _addresses) public onlyOwner {
        for (uint cnt = 0; cnt < _addresses.length; cnt++) {
            assert(!verifiedAddresses[_addresses[cnt]]);
            verifiedAddresses[_addresses[cnt]] = true;
        }
    }
    
    function salvageTokensFromContract(address _tokenAddress, address _to, uint _amount) public onlyOwner{
        ERC20TokenInterface(_tokenAddress).transfer(_to, _amount);
    }
    
    function killContract() public onlyOwner {
        selfdestruct(owner);
    }
}