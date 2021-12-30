// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.4.22;

contract Token {

    // Variables
    uint public totalSupply = 10000 * 10 ** 18;
    string public name = "Test Token";
    string public symbol = "TTK";
    uint public decimals = 18;

    // Mappings
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowance;

    // Events
    event Transfer(address indexed from, address indexed to, uint amount);
    event Approval(address indexed owner, address indexed spender, uint amount);

    constructor() {
        balances[msg.sender] = totalSupply;
    }
    // Functions
    function balanceOf(address owner) public view returns(uint) {
        return balances[owner];
    }

    function transfer(address to, uint amount) public returns (bool) {
        require(balanceOf(msg.sender) >= amount, "Balance to low");
        balances[to] += amount;
        balances[msg.sender] -= amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }
    
    function transferFrom(address from,address to, uint amount) public returns (bool) {
        require(balanceOf(from) >= amount, "Balance to low");
        require(allowance[from][msg.sender] >= amount, "Balance to low");
        balances[to] += amount;
        balances[msg.sender] -= amount;
        emit Transfer(from, to, amount);
        return true;
    }

    function approve(address spender, uint amount) public returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
}
