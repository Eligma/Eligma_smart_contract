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

pragma solidity ^0.4.13;

import "./Crowdsale.sol";

contract EligmaCrowdsaleContract is Crowdsale {
  
  function EligmaCrowdsaleContract() {

    crowdsaleStartBlock = 5456652;
    crowdsaleEndedBlock = 5584081; 

    minCap = 0 * 10**18;
    maxCap = 161054117 * 10**18;

    blocksInADay = 6000;
  }
}
