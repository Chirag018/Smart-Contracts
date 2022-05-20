// SPDX-License-Identifier: MIT
pragma solidity >=0.8.4;

contract Election {
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    mapping(address => bool) public voters;
    mapping(uint256 => Candidate) public candidates;

    uint256 public candidateCount;

    constructor() public {
       addCandidate("candidate 1");
       addCandidate("candidate 2");
    }

    function addCandidate(string memory _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }

    function vote(uint256 _candidateId) public {
        require(!voters[msg.sender]);

        require(_candidateId > 0 && _candidateId <= candidateCount);

        voters[msg.sender] = true;

        candidates[_candidateId].voteCount++;
    }
}
