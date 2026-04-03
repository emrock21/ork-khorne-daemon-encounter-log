# Ork Khorne Daemon Encounter Log

An on-chain ledger of Ork descriptions of encounters with Khorne’s daemons,  
blood cults, warp-beasts, and rage-filled entities of the Blood God.

Each entry uses a short 3‑line format describing how da red gitz acted  
and how da scrap ended. The community votes whether the encounter was  
**WAAAGH-approved** or **not proppa'.**

---

## Contract

Deployed on Base:  
`0x3d73778bC293645D5aBEAa1B65Ef41B1E9E11F9C`  
https://basescan.org/address/0x3d73778bc293645d5abeaa1b65ef41b1e9e11f9c#code

Main file: `contracts/KhorneDaemonEncounterLog.sol`

---

## Example encounter

```solidity
recordEncounter(
  "Bloodletter Warband",
  "Da red ladz charged screamin' like dey were late for a skull-countin' contest.",
  "Da scrap ended wiv chopped bitz, loud roarin', an' da boyz arguin' who got da biggest cut."
);

Voting
voteEncounter(1, true);   // WAAAGH-approved
voteEncounter(1, false);  // Not proppa'

Closing Note
A brutal chronicle of da Blood God’s finest —
da slicey ones, da shouty ones,
an' da ones dat only stop runnin' when dere's no more skulls left.
