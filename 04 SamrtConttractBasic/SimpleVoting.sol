// SPDX-License-Identifier: MIT

pragma solidity =0.8.26;

contract SimpleVoting{

    uint256 private  voteCandidate = 5;

    function test (uint256 a) external pure returns (uint256) {
    
        return a + 10;
    }

    function NamedArguments(uint256 a) external pure returns (uint256 b, uint256 c){
        b= a * 5;
        c = a * 10;
    } 

    function displayPrivateVariable() public view returns (uint256){
        return voteCandidate;
    }
}