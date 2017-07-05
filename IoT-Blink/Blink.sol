pragma solidity ^0.4.11;

contract Blink {
    uint blink;
    
	event ItBlinks(uint data);
	
	function set(uint x) {
        blink = x;
    	ItBlinks(blink);	
	}
    
	function get() constant returns (uint retVal) {
        return blink;
    
	}
}