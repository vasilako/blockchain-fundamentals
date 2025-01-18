// SPDX-License-Identifier: MIT

pragma solidity =0.8.26;

contract EnumExample {
    // Дефиниране на enum с име "Status"
    enum Status {
        Pending, // 0
        Approved, // 1
        Rejected, // 2
        MyTesting // 3
    }

    // Деклариране на променлива от тип "Status"
    Status public status;

    function setStatus(uint _status) public {
        // Присвояване на стойност към променливата "status"
        status = Status(_status);
    }

    function getStatus() public view returns (string memory) {
        if (status == Status.Pending) {
            return "Pending";
        } else if (status == Status.Approved) {
            return "Approved";
        } else if (status == Status.Rejected) {
            return "Rejected";
        } else if (status == Status.MyTesting) {
            return "My Testing";
        }    
        return "your c";
    }
}