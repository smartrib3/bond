pragma solidity ^0.8.0;

// Define the Bond contract
contract Bond {
    // Define the BondStruct struct to represent a bond
    struct BondStruct {
        uint256 faceValue; // The face value of the bond
        uint256 interestRate; // The interest rate of the bond
        uint256 maturityDate; // The maturity date of the bond
        uint256 redemptionValue; // The redemption value of the bond
        address issuer; // The wallet address of the bond issuer
    }

    // Create an array to store all of the bonds that have been issued
    BondStruct[] bonds;

    // Define the issueBond function to allow an issuer to create a new bond
    function issueBond(uint256 _faceValue, uint256 _interestRate, uint256 _maturityDate, uint256 _redemptionValue) public {
        // Add a new BondStruct instance to the bonds array with the specified parameters
        bonds.push(BondStruct(_faceValue, _interestRate, _maturityDate, _redemptionValue, msg.sender));
    }

    // Define the getBondDetails function to retrieve the details of a bond by its ID
    function getBondDetails(uint256 bondId) public view returns (uint256, uint256, uint256, uint256, address) {
        // Retrieve the specified bond from the bonds array
        BondStruct memory bond = bonds[bondId];
        // Return the face value, interest rate, maturity date, redemption value, and issuer of the bond
        return (bond.faceValue, bond.interestRate, bond.maturityDate, bond.redemptionValue, bond.issuer);
    }
}
