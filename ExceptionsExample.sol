pragma solidity ^0.5.13;

contract ExceptionsExample {
    
    mapping(address => uint) public accounts;
    
    function receiveMoney() payable public {
        assert(accounts[msg.sender] + msg.value > accounts[msg.sender]);
        accounts[msg.sender] += msg.value;
    }
    
    function sendMoney(address payable toAddress, uint amount) public {
        require(accounts[msg.sender] - amount >= 0, "You need to have more Ether in balance, to make this transaction");
        assert(accounts[msg.sender] - amount <= accounts[msg.sender]);
        accounts[msg.sender] -= amount;
        toAddress.transfer(amount);
    }
    
}