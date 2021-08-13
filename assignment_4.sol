pragma solidity ^0.8.1;


contract Assignment4 {
    address private one;
    address private two;
    address private three;
    constructor(address _one, address _two, address _three){
        one = _one;
        two = _two;
         three = _three;
    }
    
    function first(address a, address b, address c) internal pure returns(bytes32 e) {
       bytes32 d = keccak256(abi.encodePacked(a,b));
       e = keccak256(abi.encodePacked(d,c));
    }
    
    
    function second(uint f, bytes32 g) public view returns(bytes32 lastHash) {
        bytes32 j = keccak256(abi.encodePacked(g));
        bytes32 h = keccak256(abi.encodePacked(f));
        uint i = uint(keccak256(abi.encodePacked(j)));
        bytes32 firsthash = first(one, two, three);
        lastHash = keccak256(abi.encodePacked(h, i, firsthash));
    }
}


