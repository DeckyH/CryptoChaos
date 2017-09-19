pragma solidity ^0.4.11;

//import './DateTime.sol' ;

contract Deposit {
    
    //
    address public owner ;
    
    // timestamps in seconds from zero time ie: 01 January 1970 00:00:00 UTC 
    uint256 internal startDate ;
    uint256 internal endDate ;
    uint256 internal currentDate ;
    
    uint256 internal openingBalance ;
    
    function Deposit(uint256 _start, uint256 _end) payable {
        owner = msg.sender ;
        startDate = _start ;
        endDate = _end ;
        
        // Store original Ether Balance
        openingBalance = msg.value ;
    }
    
    
    function contractEnded() internal returns (bool){
        return false ;
    }
    
    function withdraw() payable returns (bool) {
        
        if (contractEnded()) {
            return true ;
        } else {
            return false ;
        }
    }
    
    
}
    
