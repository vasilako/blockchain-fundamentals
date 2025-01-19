// SPDX-License-Identifier: MIT

pragma solidity =0.8.26;

contract BillSplitter{

    uint256 public totalAmountToShare;
    uint256 public numPeople;
    struct Participant{
        address participantID;
        uint256 contribued;
        uint256 refunded;
        uint256 recharge;
        bool paidForSplit;
        bool isSplitCompleted;
    }

    mapping (address => Participant) public participantsInfoMap;
    Participant[] public participantsList;
    Participant[] public participantRefundedList;



    function addParticipant() public payable  {
        address participant_ = payable(msg.sender);
        uint256 amount_ = msg.value;
        Participant memory newParticipant = Participant({
                participantID: participant_,
                contribued: amount_,
                refunded: 0,
                recharge: 0,
                paidForSplit: true,
                isSplitCompleted: false
            });
            
            participantsInfoMap[participant_] = newParticipant;
            participantsList.push(newParticipant);
            
            totalAmountToShare += amount_;
            numPeople += 1;
    }

    function viewSplitInfo(uint256 totalAmount_, uint256 numPeople_)public pure returns (uint256){
       uint256 info = totalAmount_ / numPeople_;
       return info;
    }
    function splitExpense() public payable{
        require(numPeople > 0, "No participants");
        require(totalAmountToShare > 0, "No amount to split");
        require(totalAmountToShare % numPeople == 0, "Amount must be divisible by number of people");
        Participant storage splitter = participantsInfoMap[msg.sender];
        require(splitter.isSplitCompleted == false, "Split is already completed");
        
        uint256 sharePerPerson = viewSplitInfo(totalAmountToShare, numPeople);
        
        if (splitter.contribued > sharePerPerson) {
            uint256 toTransfer = splitter.contribued - sharePerPerson;
            payable(msg.sender).transfer(toTransfer);
            splitter.refunded = toTransfer;
            splitter.isSplitCompleted == true;
        
        }else if (splitter.contribued < sharePerPerson) {
            uint256 remaining = sharePerPerson - splitter.contribued;
            require(msg.value == remaining, "Must send exact remaining amount");
           // uint256 previousBalance = address(this).balance - msg.value;
       // payable(address(this)).transfer(previousBalance);     
            splitter.recharge = remaining;
            splitter.isSplitCompleted == true;
        }   
        participantRefundedList.push(splitter);
    }

    function getSenderBalance() public view returns (uint256){
        return msg.sender.balance;
    }

    function getContractBalance() public view returns (uint256){
        return address(this).balance;
    }

    function checkRefund() public view  returns (bool) {
        uint256 sharePerPerson = viewSplitInfo(totalAmountToShare, numPeople);
        Participant storage splitter = participantsInfoMap[msg.sender];        
        
        if (splitter.contribued > sharePerPerson){
            return true;
        }else{
            return false;

        }
    }
    

}