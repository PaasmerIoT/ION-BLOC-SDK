/*
    This is a sample contract code to create an event
*/
pragma solidity ^0.4.13;

contract Blink {
    uint storedData;

	event ItBlinks(uint data);

	function set(uint x) {
        storedData = x;
    	ItBlinks(storedData);
	}

	function get() constant returns (uint retVal) {
        return storedData;

	}
}
