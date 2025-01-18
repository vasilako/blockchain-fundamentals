// SPDX-License-Identifier: MIT

pragma solidity =0.8.26;

contract PlayWithVariables {
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

    // ------ Display privagte variable --------
    uint256 private _voteCandidate = 5;

    function displayPrivateVariable() public view returns (uint256) {
        return _voteCandidate;
    }

    //------------------------------

    // Work with flag variable
    bool private _isFlag = false;

    function changeBooleanFlag() public returns (bool) {
        if (_isFlag == false) {
            _isFlag = true;
        } else {
            _isFlag = false;
        }
        return _isFlag;
    }

    function displayPrivateIsFlag() public view returns (bool) {
        return _isFlag;
    }

    //------------------------------
}
