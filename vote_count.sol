//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Polling{

    string public Question = "Which is the best blockchain among these:";
    string[] public Options = ["ethereum" , "bitcoin" , "solana" , "Koi Dusra"];

    mapping(uint => uint) public Votecount ; 
}
