pragma solidity ^0.4.11;

contract Simple {
    
    // create a public variable of type address
    // anyone can query this by running the contract
    
    address public contractOwner ;
    uint256 private rate ;
    
    // create a public variable of type uint256
    // we will copy the starting balance of the contract here 
    // when it is deployed. 
    // This is the value in wei of the ether sent to the contract
    // on deplyment
    
    uint256 public startingBalance ;
    
    // function Simple()
    // This function has the same name as the contract
    // It works as a constructor method 
    // and runs automatically when the contract is created
    // It only runs once so can be used to setup variables etc.
    // to intiate the contract
    
    function Simple() payable {
        
        // so the first message sender ie: deployer/runner
        // of the contract will be assigned the conract owner
        // the value of funds sent on deploy is copied to starting balance
        
        
        contractOwner = msg.sender ;
        startingBalance = msg.value ;
        
    }
    
    // function getContractAddress()
    // As it says this function gives you the address 
    // of the contract which is assigned by Ethereum
    // this function is just here so as we can see the value
    // in theory you'd never use this
    function getContractAddress() returns (address) {
        return this ;
    }
    
    // function getBalance()
    // this function will return the actual wei balance of the contract
    // so if it was run 100 times for example we's have a different balance
    // than at the start
    function getBalance() payable returns (uint256) {

        return this.balance ;
    }
    
    function setRate(uint256 _rate) {
        if (msg.sender == contractOwner) {
            rate = _rate ;
        }
    }
    
    function getRate() returns (uint256) {
        if (msg.sender == contractOwner) {
            return rate ;
        } 
    }
    
}
