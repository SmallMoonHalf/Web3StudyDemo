pragma solidity ^0.4.24;

contract Voting {
    bytes32[] public candidateList;
    mapping(bytes32 => uint8) public voteReceived;
    constructor(bytes32[] memory candidateListName) public {
        candidateList = candidateListName;
    }
    function validateCandidate(bytes32 candidateName) internal view returns(bool) {
        for (uint8 i = 0; i < candidateList.length; i++) {
            if (candidateName == candidateList[i]) {
                return true;
            }
            
        }
        return false;
    }
    
    function vote(bytes32 candidateName) public {
        require(validateCandidate(candidateName));
        voteReceived[candidateName] += 1;
    }
    
    function totalVotesFor(bytes32 candidateName) public view returns(uint8) {
        require(validateCandidate(candidateName));
        return voteReceived[candidateName];
    }
}