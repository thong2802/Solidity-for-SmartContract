pragma solidity >= 0.7.0 < 0.9.0;

/* 
- Bid (phiên đấu giá)
    + Thời gian đấu giá còn hoạt động
    + Giá trị đặt > giá lớn nhất tại thời điểm đó
    + Bid != 0
- Withdraw (rút tiền)
    + amount > 0
    + amount = bid
    + after send = 0;
- AuctionEnd
    + Khi nào kết thúc phiên đấu giá
    + Tranfer(chuyển khoản) cho người đã taọ phiên đấu giá.
*/
contract simpleauction {
    // Variable
    uint public  auctionTimeEnd;
    uint public highesBid;
    address public highesBidder;
    mapping(address => uint) pendingReturns;
    bool ended = false;
    address payable public beneficiary;

    event highesBidIncrease(address bidder, uint amount);
    event auctionEnded(address winner, uint amount);
    
    constructor(
        uint biddingTime,
        address payable beneficiaryAddress
    ) {
        beneficiary = beneficiaryAddress;
        auctionTimeEnd = block.timestamp + biddingTime;
    }
    // Function
    function bid() public payable{
        if(block.timestamp > auctionTimeEnd) {
            revert("Phien dau gia da ket thuc");
        }
        if(msg.value <= highesBid) {
            revert("gia cua ban thap hon gia cao nhat hien tai");

        }
        if(highesBid != 0) {
            pendingReturns[highesBidder] += highesBid;
        }

        highesBidder = msg.sender;
        highesBid    = msg.value;
        emit highesBidIncrease(msg.sender, msg.value);

    }

    function withdraw() public returns(bool){
        uint amount = pendingReturns[msg.sender];
        if(amount > 0) {
            pendingReturns[msg.sender] = 0;

           if(!payable(msg.sender).send(amount)) {
               pendingReturns[msg.sender] = amount;
               return false;
           }
        }
        return true;
    }

    function auctionEnd() public {
        if(ended == true) {
            revert("phien dau gia co the da ket thuc");
        }
        if(block.timestamp < auctionTimeEnd) {
              revert("phien dau gia chua ket thuc");
        }
        ended = true;
        emit auctionEnded(highesBidder, highesBid);

        beneficiary.transfer(highesBid);

    }
}