pragma solidity ^0.4.11;

contract BeerCoin {
    
    // 1 Beer = 0.03 ETHER
    // 1 Round = 4 Beers ie: 0.12
    
    address public Dec ;
    address public Raj ;
    address public Greg ;
    address public Dave ;
    
    address public minter ;
    
    mapping (address => uint) public balances;
    
    event Sent(address from, address to, uint amount);

    function BeerCoin() payable {
        
        Dec = 0xca35b7d915458ef540ade6068dfe2f44e8fa733c ;
        Raj = 0x14723a09acff6d2a60dcdf7aa4aff308fddc160c ;
        Greg = 0x4b0897b0513fdc7c541b6d9d7e929c4e5364d2db ;
        Dave = 0x583031d1113ad414f02576bd6afabfb302140225 ;
        

    }
    
    function mint() {
        if (msg.sender != minter) return;
        balances[Dec] += 1;
        balances[Raj] += 1;
        balances[Greg] += 1;
        balances[Dave] += 1;
        
    }
    
    function send(address receiver, uint amount) {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        Sent(msg.sender, receiver, amount);
    }

    
    
    // contract specific
    function getContractAddress() returns (address) {
        return this ;
    }
    
    function getBalance() returns (uint256) {
        return this.balance ;
    }
    
    function() payable { }

}
