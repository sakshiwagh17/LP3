//SDPX-License-Identifier:MIT
/*The pragma line tells the compiler to use Solidity version 0.8.17 or newer (but below 0.9.0).*/
pragma solidity ^0.8.17;

contract BCT_Bank{
/*This creates a mapping (like a key–value pair or dictionary).*/
    mapping(address=>uint256) private balances;
    /* Emitted when `account` deposits `amount` wei. */
    event Deposited(address indexed account,uint256 amount);
    /* Emitted when `account` withdraws `amount` wei.*/
    event Withdrawn(address indexed account,uint256 amount);

    /*  Deposit ETH into the caller's bank account balance.
	  Use `msg.value` to specify deposit amount.*/
    function deposit() external payable{
        require(msg.value>0,"Amount should be greater than 0");
        balances[msg.sender]+=msg.value;
        emit Deposited(msg.sender,msg.value);
    }
  /*  Withdraw `amount` wei from the caller's bank account.
	  amount Amount in wei to withdraw.*/
    function withdraw(uint256 amount) external payable{
        require(amount>0,"Amount should be greater than 0");
        require(balances[msg.sender]>=amount,"Insuffiencit balances");
        balances[msg.sender]-=amount;
        payable(msg.sender).transfer(amount);
        emit Withdrawn(msg.sender,amount);
    }

/*Return the caller's balance*/
    function getBalances() external view returns(uint256){
        return balances[msg.sender];
    }
}
