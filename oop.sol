pragma solidity >= 0.7.0 < 0.9.0;

// inheritance, Modifier
contract FirstCoin {
    // Create a mount token : done
    // - Minter
    // - Supply
    // - Amount
    address public minter;
    mapping(address => uint) public balances;

    event sent(address from, address to, uint amount);

    constructor () {
        minter = msg.sender;
    }

    modifier onlyMinter {
        require(msg.sender == minter);
        _;
    }
    modifier checkAmount(uint amount) {
        require(amount < 1e60);
        _;
    }

    modifier checkBalance(uint amount) {
         require(amount <= balances[msg.sender], "not enought money, don't send token");
         _;
    }
    function mint(address receiver, uint amount)public onlyMinter checkAmount(amount){
    //    require(msg.sender == minter);
    //    require(amount < 1e60);
    //    balances[receiver] += amount;
        balances[receiver]  = balances[receiver] + amount;
    }

    // Send token
    function sendToken(address receiver, uint amount) public checkBalance(amount) {
    //  require(amount <= balances[msg.sender], "not enought money, don't send token");
        balances[msg.sender] -= amount;
        balances[receiver]   += amount;
        emit sent(msg.sender, receiver, amount);
        
    }
}