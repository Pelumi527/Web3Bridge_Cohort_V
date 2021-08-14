//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Assignment4{
    mapping(address => uint) public addresstoffxnint;
    mapping(address => bytes32) public addressTofxnHash;
    
    function fxnone() public returns(bool){
        addressTofxnHash[msg.sender] = keccak256(abi.encodeWithSignature("fxnone()"));
        addresstoffxnint[msg.sender]++;
        return true;
    }
    
    
     function fxnsecond() public returns(bool){
         addressTofxnHash[msg.sender] = keccak256(abi.encodeWithSignature("fxnsecond()"));
         addresstoffxnint[msg.sender]++;
        return true;
    }
    
     function fxnthird() public returns(bool){
        addressTofxnHash[msg.sender] = keccak256(abi.encodeWithSignature("fxnthird()"));
        addresstoffxnint[msg.sender]++;
        return true;
    }
    
}