// SPDX-License-Identifier: MIT

// A particular financial institution is looking to have their records stored onchain and 
// looking to have an *external *`identifier` tied to each customers Details....the identifier 
// should be the keccak256 hash of the customer's name and time of registration , 
// each customer can also approve another customer to view their details[meaning that only admins and approved
// customers have the right to view another customer's data]....For simplicity purposes, the Bank is looking to 
// have a separate contract that has all *setter* functions and another contract that has all the
// *getter * functions(Interacting with each other of course)..Finally, they want
// an interface for all the contracts they have......NOTE: USE THE APPROPRIATE FUNCTION AND VARIABLE VISIBILITY SPECIFIERS


pragma solidity ^0.8.1;

interface IcustomerSetter{
    struct Cust {
         string name;
         uint256 age;
         bytes4 hash;
         address _address;
     }
    
      function SetCust(string memory _name, uint256 _age, address _CustAddr) external returns(Cust memory);
      
      function AllowAccess(address _addr, bytes4 _custHash) external;
      
      function WithdrawAccess(address _addr, bytes4 _custHash) external;
}

contract customerSetter{
    
    address public admin;
    
    constructor(address _admin){
        admin = _admin;
    }
    
    struct CUST_DETAILS {
        string name;
        uint256 age;
        bytes4 hash;
        address _address;
    }
    
    mapping(bytes4 => CUST_DETAILS) public custDetail;
    
    mapping(bytes4=>mapping(address => bool)) public custPermission;
    
    
    
    function SetCust(string memory _name, uint256 _age, address _CustAddr) public returns(CUST_DETAILS memory){
        require(msg.sender == admin, "contact the admin");
       bytes4 _custHash = bytes4(keccak256(abi.encodePacked(_name, block.timestamp)));
       CUST_DETAILS storage cust_details = custDetail[_custHash];
       cust_details.name = _name;
       cust_details.age = _age;
       cust_details.hash = _custHash;
       cust_details._address = _CustAddr;
       
       AllowAccess(_CustAddr,_custHash);
       return cust_details;
    }
    
    function AllowAccess(address _addr, bytes4 _custHash) public {
        CUST_DETAILS memory cust_details = custDetail[_custHash];
        require(cust_details._address == msg.sender || admin == msg.sender, "invalid hash");
        custPermission[_custHash][_addr] = true;
    }
    
    function WithdrawAccess(address _addr, bytes4 _custHash) public {
        CUST_DETAILS memory cust_details = custDetail[_custHash];
        require(cust_details._address == msg.sender || admin == msg.sender, "invalid hash");
        custPermission[_custHash][_addr] = false;
    }
}