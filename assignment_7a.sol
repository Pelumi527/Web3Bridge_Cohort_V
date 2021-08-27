pragma solidity ^0.8.1;
// SPDX-License-Identifier: MIT

import "./assignment_7.sol";

interface ICustomerSetter{
    function GetCust(bytes4 _custHash) external view returns (string memory,uint, bytes4, address);
} 

abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

contract Customergetter is Context{
    
     customerSetter Icust;
     
     constructor(address contractAdd){
         Icust = customerSetter(contractAdd);
     }
    
    function GetCust(bytes4 _custHash) public view returns (string memory,uint, bytes4, address){
        require(Icust.admin() == _msgSender()
        || Icust.custPermission(_custHash,_msgSender()) == true, "access denied");
        return Icust.custDetail(_custHash);
    }
}                   