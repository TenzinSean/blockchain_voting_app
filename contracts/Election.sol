pragma solidity ^0.4.11;

contract Election {
  // Model a Candidate
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  // Store accounts that have voted
  mapping(address => bool) public voters;
  // store candidate
  // Fetch candidate
  mapping(uint => Candidate) public candidates;
  // Store candidate Count
  uint public candidatesCount;

  function Election () public {
      addCandidate("Candidate 1");
      addCandidate("Candidate 2");
  }

  function addCandidate (string _name) private {
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  function vote (uint _candidateId) public {
    // require that they have voted before
    require(!voters[msg.sender]);

    // require that valid candidates
    require(_candidateId > 0 && _candidateId <= candidatesCount);

    // record that voter has voted
    voters[msg.sender] = true;

    // update candidate vote Count
    candidates[_candidateId].voteCount ++;
  }
}
