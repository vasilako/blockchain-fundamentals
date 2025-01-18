// SPDX-License-Identifier: MIT

pragma solidity =0.8.26;

contract SimpleVoting {
   

    address private _owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address private _cadidateOne = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address private _cadidateTwo = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;

    function vote(address voteTo_) public {
        require(voteTo_ != 0);
        require(!_isVoted[voteTo_]);
        _isVoted[voteTo_] = true;

        uint256 voteAmount = 0;
        if (voteTo_ == _cadidateOne) {
            voteAmount++;
        }
        require(!_isVoted[candidate]);
        _isVoted[msg.sender] = true;
        uint256 candidateValue = 0;
        if (candidate == _cadidateOne) {
            candidateValue++;
        }
    }
}
