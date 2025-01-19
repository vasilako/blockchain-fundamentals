// SPDX-License-Identifier: MIT

pragma solidity =0.8.26;

contract Payroll {
    
    function calculatePaycheck(uint256 salary, uint256 rating) public pure returns (uint){
        require(rating > 0 && rating <= 10, "Rating must be between 0 and 10");
        require(salary > 0, "Salary myst be positiv number");
        if (rating > 8){ 
        return salary += salary * 10/100;
        }
        return salary;

    }

}