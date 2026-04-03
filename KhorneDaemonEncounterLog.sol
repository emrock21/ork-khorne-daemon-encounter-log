// SPDX-License-Identifier: MIT
pragma solidity 0.8.31;

/// @title Khorne Daemon Encounter Log
/// @notice Records short Ork descriptions of encounters with Khorne's daemons and blood cult entities.
/// @dev Fully safe: no payments, no owner, no external calls, no selfdestruct.

contract KhorneDaemonEncounterLog {

    address constant EXAMPLE_ADDRESS = 0x0000000000000000000000000000000000000001;

    struct Encounter {
        string entity;    // Bloodletter, Flesh Hound, Bloodthirster, Skull Cult, etc.
        string behavior;  // Short description of how da blood-crazed gitz acted
        string outcome;   // Short description of how da scrap ended
        address creator;  // Who recorded it
        uint256 approved; // Votes for proppa'
        uint256 rejected; // Votes for not proppa'
        uint256 createdAt;// Timestamp
    }

    Encounter[] public logs;

    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event EncounterRecorded(uint256 indexed id, string entity, address indexed creator);
    event EncounterVoted(uint256 indexed id, bool approved, uint256 approvedVotes, uint256 rejectedVotes);

    constructor() {
        logs.push(
            Encounter({
                entity: "Example Khorne Entity (Fill your own below)",
                behavior: "Describe how da blood-mad daemon acted.",
                outcome: "Describe how da scrap ended.",
                creator: EXAMPLE_ADDRESS,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );
    }

    function recordEncounter(
        string calldata entity,
        string calldata behavior,
        string calldata outcome
    ) external {
        require(bytes(entity).length > 0, "Entity required");

        logs.push(
            Encounter({
                entity: entity,
                behavior: behavior,
                outcome: outcome,
                creator: msg.sender,
                approved: 0,
                rejected: 0,
                createdAt: block.timestamp
            })
        );

        emit EncounterRecorded(logs.length - 1, entity, msg.sender);
    }

    function voteEncounter(uint256 id, bool approved) external {
        require(id < logs.length, "Invalid ID");
        require(!hasVoted[id][msg.sender], "Already voted");

        hasVoted[id][msg.sender] = true;

        Encounter storage e = logs[id];

        if (approved) {
            e.approved += 1;
        } else {
            e.rejected += 1;
        }

        emit EncounterVoted(id, approved, e.approved, e.rejected);
    }

    function totalEncounters() external view returns (uint256) {
        return logs.length;
    }
}
