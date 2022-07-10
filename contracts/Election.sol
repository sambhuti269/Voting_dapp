// SPDX-License-Identifier: MIT

pragma solidity >=0.4.20;

contract Election {
    // Read/write candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //store candidates
    mapping(uint => Candidate) public candidates;

    // Store accounts that have voted
    mapping(address => bool) public voters;

    uint public candidatesCount;

    event votedEvent(uint256 indexed _candidateId);

    // Constructor
    constructor() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");    
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++; //also id
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        //require that the address is NOT in the mapping, 
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        //emit voted event
        emit votedEvent(_candidateId);
    }

    

}
