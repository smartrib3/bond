pragma solidity ^0.8.0;

contract Bond {
    struct BondStruct {
        uint256 faceValue;
        uint256 interestRate;
        uint256 maturityDate;
        uint256 redemptionValue;
        address issuer;
    }

    BondStruct[] bonds;

    function issueBond(uint256 _faceValue, uint256 _interestRate, uint256 _maturityDate, uint256 _redemptionValue) public {
        bonds.push(BondStruct(_faceValue, _interestRate, _maturityDate, _redemptionValue, msg.sender));
    }

    function getBondDetails(uint256 bondId) public view returns (uint256, uint256, uint256, uint256, address) {
        BondStruct memory bond = bonds[bondId];
        return (bond.faceValue, bond.interestRate, bond.maturityDate, bond.redemptionValue, bond.issuer);
    }
}
