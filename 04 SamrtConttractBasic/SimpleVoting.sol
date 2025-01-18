// SPDX-License-Identifier: MIT

pragma solidity =0.8.26;

import "@openzeppelin/contracts/utils/Strings.sol";

contract SimpleVoting {
    mapping(address => bool) private voters;
    mapping(address => uint256) private  candidatesResults;
    address private  voter;
    address private  _owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address private  _cadidateOne = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    address private  _cadidateTwo = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    address[2] private  allCandidates = [_cadidateOne, _cadidateTwo];
    address[] private  allVoters;
    uint256 private  voterCount;

    enum ListCandidates {
        _cadidateOne,
        _cadidateTwo
    }

    event Vote(address indexed voter, ListCandidates candidate);

    function vote(ListCandidates candidate_) public {
        voter = msg.sender;
        require(!voters[msg.sender], "You have already voted");
        require(voter != _owner, "Owner cant vote");
        require(voterCount <= 5, "Voting finished");
        voters[voter] = true;
        allVoters.push(voter);
        voterCount++;

        if (ListCandidates._cadidateOne == candidate_) {
            candidatesResults[_cadidateOne]++;
            emit Vote(voter, ListCandidates._cadidateOne);
        } else if (ListCandidates._cadidateTwo == candidate_) {
            candidatesResults[_cadidateTwo]++;
            emit Vote(voter, ListCandidates._cadidateTwo);
        }
    }

    using Strings for address;
    using Strings for uint256;

    function getResult() public view returns (string memory){
        string memory result;
        for (uint256 i = 0; i < allCandidates.length; i++) {
            string memory strAddress = allCandidates[i].toHexString();
            string memory strNumber = candidatesResults[allCandidates[i]].toString();
            result = string(abi.encodePacked(result, strAddress, " = ", strNumber, "\n", "---------"));
        }
        return result;
    }
}
