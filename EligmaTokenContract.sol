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

import "./ERC20Token.sol";

contract EligmaTokenContract is ERC20Token {

  function EligmaTokenContract() public {
    name = "EligmaToken";
    symbol = "ELI";
    decimals = 18;
    mintingContractAddress = 0x4d06047ED426E2A2F0BbE86CeE268200d20b8D62;
    lockFromSelf(5584081, "Lock before crowdsale starts");
  }
}