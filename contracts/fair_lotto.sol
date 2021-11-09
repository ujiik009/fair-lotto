// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;



contract FairLotto   {

   
    address admin;
    uint room_id;
    struct Room{
        uint roomId; // roomId
        uint bid; // bid of lottoly in that time for example Everyone has to pay 5 ETH for biding.
        bytes2 lottoly_number; // can be 00-99
        bool status; // status of period lottoly
        
    }
    
    struct Player{
        address player_addr; // address of palyer
        bytes2 lottoly_number; // can be 00-99
    }
    
    
    Room[] private rooms;
    
    
    // data we keep each of rooms have palyer in room and what number thay buy
    mapping(uint => Player[]) public room_join; 
    
    constructor()  {
        admin = msg.sender;
  
    }
    
    function get_length_room() public view returns(uint length_room){
        return rooms.length;
    }
    
    
    function create_room(uint bid) public{
        require(bid > 0 ,"You bid has more than zero");
        room_id++;
        
        rooms.push(
            Room({
                roomId:room_id,
                bid:bid,
                lottoly_number:0,
                status:true
            })
        );
    }
    
    
    // join room by room number
    function join_room(uint room_number,bytes2 lottoly_number) public {
        
    }
    
    function get_random() public view returns(uint random_number) {
        return random();
    }
    
    function random() private view returns(uint) {
        return uint(sha256(abi.encodePacked(block.difficulty, block.timestamp, block.timestamp+block.difficulty)));
    }
    
    function substring(string memory str, uint startIndex, uint endIndex) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(endIndex-startIndex);
        for(uint i = startIndex; i < endIndex; i++) {
            result[i-startIndex] = strBytes[i];
        }
        return string(result);
    }
    

 
    
}