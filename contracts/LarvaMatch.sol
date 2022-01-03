// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract LarvaMatch is Ownable {

  uint256 public larvaLadMaxSupply = 5000;
  uint256 public punkMaxSupply = 10000;

  mapping(uint256 => uint256[]) private larvaToPunks;
  mapping(uint256 => bool) private larvaToPunksSaved;

  mapping(uint256 => uint256[]) private punkToLarvas;
  mapping(uint256 => bool) private punksToLarvasSaved;

  constructor() public {
  }

  function savePunkMatchesForLarva(uint256 larvaTokenId, uint256[] memory punkTokenIds) public onlyOwner returns (bool success) {
    require(larvaTokenId < larvaLadMaxSupply, "LarvaLad tokenId is not valid.");
    require(punkTokenIds.length > 0, "Need to specify one or more punkTokenIds");
    // TODO iterate array to confirm validity? or trust myself :D
    larvaToPunks[larvaTokenId] = punkTokenIds;
    larvaToPunksSaved[larvaTokenId] = true;
    // TODO introspect punksToLarvas mapping and tackon on the inverse of this match?
  }

  function saveLarvaMatchesForPunk(uint256 punkTokenId, uint256[] memory larvaTokenIds) public onlyOwner returns (bool success) {
    require(punkTokenId < punkMaxSupply, "CryptoPunk tokenId is not valid.");
    require(larvaTokenIds.length > 0, "Need to specify one or more punkTokenIds");
    // TODO iterate array to confirm validity? or trust myself :D
    larvaToPunks[punkTokenId] = larvaTokenIds;
    punksToLarvasSaved[punkTokenId] = true;
    // TODO introspect larvasToPunks mapping and tackon on the inverse of this match?
  }

  function findMyPunks(uint256 larvaTokenId) public view returns (uint256[] memory punkTokenIds) {
    require(larvaTokenId < larvaLadMaxSupply, "LarvaLad tokenId is not valid.");
    return larvaToPunks[larvaTokenId];
  }
  
  function findMyLarvas(uint256 punkTokenId) public view returns (uint256[] memory larvaTokenIds) {
    require(punkTokenId < punkMaxSupply, "CryptoPunk tokenId is not valid.");
    return punkToLarvas[punkTokenId];
  }
}
