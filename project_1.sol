//SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    Candidate[] public candidate ;

    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Store Candidates
    // Fetch Candidate
    mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    // function Election () public {
    //     xxx
    // }

    function addCandidate (string memory _name) private {
        uint id = candidate.length ;
        candidate.push( Candidate(id , _name , 0) );
        candidatesCount++;
    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require ( voters[msg.sender] == true);

        // require a valid candidate
        require ( _candidateId == candidates[_candidateId].id );

        // record that voter has voted
        voters[msg.sender] = true ;

        // update candidate vote Count
        candidates[_candidateId].voteCount++ ;

        // trigger voted event
        emit votedEvent(_candidateId);
    }
}
