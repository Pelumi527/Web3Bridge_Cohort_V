// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.1;
contract Arrys {
     uint[2][5][3][4]  street= [
       [[[1,2],[1,4],[6,1],[1,4],[5,3]],[[1,7],[2,3],[9,8],[2,0],[3,3]],[[3,1],[2,3],[3,5],[2,0],[3,9]]],
       [[[1,3],[4,4],[5,1],[2,4],[2,3]],[[3,7],[2,3],[9,8],[2,3],[4,3]],[[2,1],[2,3],[8,5],[2,8],[9,9]]],
       [[[2,2],[0,4],[9,1],[5,4],[9,3]],[[4,7],[2,3],[0,8],[2,7],[2,3]],[[8,1],[2,3],[3,5],[2,1],[4,9]]],
       [[[4,2],[8,4],[2,1],[2,4],[3,3]],[[1,7],[2,3],[9,8],[2,2],[7,3]],[[9,1],[2,3],[2,5],[2,2],[5,9]]]
      ];
      uint public noOfHouses = (street.length);
      uint public noOfFlats = (street[1].length)*noOfHouses;
      uint public noOfRooms = (street[1][1].length)*noOfFlats;
      uint public noOfPeople = (street[1][1][1].length)*noOfRooms;
}