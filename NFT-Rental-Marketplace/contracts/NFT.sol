// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity ^0.8.3;

// Helper functions OpenZeppelin provides.
import "@openzeppelin/contracts/utils/Counters.sol";

// NFT contract to inherit from.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Makes Debugging Easy
import "hardhat/console.sol";

// @title NFT 
/// @author Shiva Shanmuganathan
/// @notice This contract implements a simple NFT contract for the NFT Rental Marketplace 
/// @dev All function calls are currently implemented without any bugs
contract NFT is ERC721URIStorage {
    
    // We will use counters for tracking tokenId
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    
    /// @notice Constructor function initializes the address of NFT Rental Marketplace Contract
    /// @dev contractAddress is set in constructor, so that we will be able to use it in modifier for verifying the sender of transaction
    constructor() ERC721("RentableNFT", "RFT") {
    }

      
    /// @notice Create RFT Tokens by using mint & setTokenURI
    /// @dev First TokenId is incremented to 1
    /// @param tokenURI This string contains the image url link, which is associated to the NFT
    /// @return Returns the itemId of the created token
    function createToken(string memory tokenURI) public returns (uint) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }

    

}