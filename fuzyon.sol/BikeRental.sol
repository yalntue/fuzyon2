// SPDX-License-Identifier: MIT 
// Akilli Kontrat: Esya Kiralama
pragma solidity ^0.8.0;

contract BikeRental {
    address public owner; // Bisiklet sahibinin adresi
    address public renter; // Kiracinin adresi
    uint256 public rentStartTime; // Kiralama süresinin baslangic zamani
    uint256 public rentDuration; // Kiralama suresi (saniye)
    uint256 public rentPrice; // Kiralama ucreti (wei)

    constructor(uint256 _duration, uint256 _price) {
        owner = msg.sender;
        rentDuration = _duration;
        rentPrice = _price;
    }

    // Bisikleti kiralamak icin cagrilacak fonksiyon
    function rentBike() external payable {
        require(renter == address(0), "Bisiklet zaten kiralandi.");
        require(msg.value == rentPrice, "Yetersiz odeme.");

        renter = msg.sender;
        rentStartTime = block.timestamp;
    }

    // Bisikletin iadesi için çağrılacak fonksiyon
    function returnBike() external {
        require(msg.sender == renter, "Sadece kiraci iade yapabilir.");
        require(block.timestamp >= rentStartTime + rentDuration, "Kiralama suresi bitmeden iade yapilamaz.");

        uint256 extraTime = block.timestamp - (rentStartTime + rentDuration);
        uint256 extraCost = (extraTime / 1 minutes) * (rentPrice / 60); // Ek ücret hesaplama

        renter = address(0); // Kiracıyı sıfırla
        rentStartTime = 0; // Kiralama süresini sıfırla

        // Bisiklet sahibine kira ücretini ve ek ücreti öde
        payable(owner).transfer(rentPrice + extraCost);
    }
}
