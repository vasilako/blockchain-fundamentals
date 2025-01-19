// SPDX-License-Identifier: MIT

pragma solidity =0.8.26;

contract CompoundInterestCalculator {
    
    function calculateInteresCompound(uint256 principal_, uint256 interestRate_, uint256 years_) public pure returns (uint256) {
       require(principal_ > 0, "Invalid principal");
        require(years_ > 0 && interestRate_ > 0, "Invalid Interest Rate or Year");
        uint256 totalWithInterests = principal_;
        
        for (uint256 i = 0; i < years_; i++) {
             uint256 interest = (totalWithInterests * interestRate_) / 100;
            totalWithInterests += interest;
        
        }
        return totalWithInterests;
    }

}