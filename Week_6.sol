pragma solidity 0.8.1;
// SPDX-License-Identifier: GPL-3.0;

contract A{
    bytes32 hash_1;
    bytes32  hash_2;
    
    function createhash(address owner, uint amount) public returns(bool){
        hash_1 = keccak256(abi.encodePacked(owner, amount));
        return true;
    }
    
    function createhash2(string memory name, uint age) public returns(bool){
        hash_2 = keccak256(abi.encodePacked(name, age));
        return true;
    }
    
    function viewhash() public view returns(bytes32, bytes32) {
        return (hash_1, hash_2);
    }
}