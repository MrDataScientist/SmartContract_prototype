pragma solidity^0.4.0;


contract FuncConcert {
    
    address owner;
    uint tickets;
    uint constant price= 1 ether; // solidity allows you to use different modifiers
    mapping (address => uint) public purchasers;
    
    function FuncConcert(){
        owner = msg.sender;
        tickets = 5;
    }
    
    function buyTickets(uint amount) payable {
        if(msg.value != (amount = price) || amount > tickets){
            throw;
        }
        
        purchasers[msg.sender] += amount;
        tickets -= amount;
        
        if(tickets ==0){
            selfdestruct(owner);
        }
    }
}
