//SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract JoinSavings {
    // declare  state variables   
    // acount1 address = 0x0c0669Cd5e60a6F4b8ce437E4a4A007093D368Cb;
    // account2 address =0x7A1f3dFAa0a4a19844B606CD6e91d693083B12c0; 

    address payable accountOne;
    address payable accountTwo;
    string accountHolder = "Sam Smith";

    address public lastToWithdraw;
    uint public lastWithdrawAmount;
    uint public contractBalance;

       

    

    // using constructor runs only once save us gas on contract deployement  
    //also easy to read the code
    
    constructor(address payable account1, address payable account2) public {
         
        accountOne = account1;
        accountTwo = account2;
    }
   

    function withdraw(uint amount, address payable recipient ) public{
        
        // declare local variables 
       require(recipient == accountOne || recipient == accountTwo, "You don't own this account!");
       require(address(this).balance >= amount, "Insufficient funds!");


    

        
       if(lastToWithdraw != recipient){ // lastToWithdraw not equal to recipient
             lastToWithdraw = recipient;  // then set it equal to amount
       

       }
       recipient.transfer(amount); //.transfer for payable
       lastWithdrawAmount = amount; // set lastwithdraw to amount
       contractBalance = address(this).balance - amount; // balance of the contract    
       }                 
    function deposit() public payable {
        // declare global variables 
        contractBalance = address(this).balance;
        }     
           
                         

    
    function() external payable{
        // any value of ether contract can get form outside 

    }


    
   
           

        
    

    

}
       


       







    


