pragma solidity ^0.4.11;

contract BetMarket {
    
    address public owner ;
    uint256 public marketId ;
    uint256 internal openingBalance ;
    
    struct bet {
        uint256 amount;
        uint256 odds ;
        string betType ;
    }
    
    mapping (address => bet) public bets ;
    
    function BetMarket(uint256 _marketId) payable {
        owner = msg.sender ;
        marketId = _marketId ;
        openingBalance = msg.value ;
    }
    
    function layBet(uint256 _amount, uint256 _odds) {
        bets[msg.sender] = bet(_amount, _odds, "lay");
    }
    
    function bidBet(uint256 _amount, uint256 _odds) {
        bets[msg.sender] = bet(_amount, _odds, "bid");
    }
    
    function matchBet() {}
    
    
}
