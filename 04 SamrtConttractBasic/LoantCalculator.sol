// SPDX-License-Identifier: MIT

pragma solidity =0.8.26;

contract loantCalculator {
    uint256 public loanAmount;
    uint256 public totalAmountToPay = 0;

    function calculateTotalPayable(uint256 interestRate_, uint256 loanPeriod_)
        public
      payable 
        returns (uint256)
    {
        uint256 interestRate = interestRate_;
        uint256 loanPeriod = loanPeriod_;

        require(
            interestRate >= 0 || interestRate <= 100,
            "Interest rate can be between 1 and 100"
        );
        require(loanPeriod <= 365, "Loan Period can be at least 365 days");
        uint256 loanPeriodInYears = loanPeriod / 365;
        totalAmountToPay =
            loanAmount +
            ((loanAmount * interestRate * loanPeriodInYears) / 100);

        return totalAmountToPay;
    }
    function setAmount(uint amount_) public {
        loanAmount = amount_;
    }
}
