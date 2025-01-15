// SPDX-License-Identifier: MIT

pragma solidity =0.8.26;

contract SimpleVoting {
    
    uint256 private _voteCandidate = 5;
    bool private _isFlag = false;

    function test(uint256 a) external pure returns (uint256) {
        return a + 10;
    }

    function NamedArguments(uint256 a)
        external
        pure
        returns (uint256 b, uint256 c)
    {
        b = a * 5;
        c = a * 10;
    }

    function displayPrivateVariable() public view returns (uint256) {
        return _voteCandidate;
    }

    function changeBooleanFlag() public returns (bool) {
        if (_isFlag == false) {
            _isFlag = true;
        } else {
            _isFlag = false;
        }
        return _isFlag;
    }
    function displayPrivateIsFlag()public view returns (bool){
        return _isFlag;
    }

    function vote (uint256 amount) public {
    
    }
}
