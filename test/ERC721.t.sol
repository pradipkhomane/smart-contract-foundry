// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import "../src/ERC721.sol";

contract CounterTest is Test {
    MyNFT myNFT;
    address bob = address(0x1);
    address mary = address(0x2);

    function testMintToken() public {
        myNFT = new MyNFT();
        myNFT.mint(bob, 0);
        address owner_of = myNFT.ownerOf(0);

        assertEq(bob, owner_of);
    }

    function testTransferToken() public {
        myNFT = new MyNFT();
        myNFT.mint(bob, 0);

        vm.startPrank(bob);

        myNFT.safeTransferFrom(bob, mary, 0);

        address owner_of = myNFT.ownerOf(0);

        assertEq(mary, owner_of);
    }

    function testGetBalance() public {
        myNFT = new MyNFT();
        myNFT.mint(bob, 0);
        myNFT.mint(bob, 1);
        myNFT.mint(bob, 2);
        myNFT.mint(bob, 3);
        myNFT.mint(bob, 4);

        uint balance = myNFT.balanceOf(bob);

        assertEq(balance, 5);
    }

    function testOnlyOwnerBurn() public {
        myNFT = new MyNFT();
        myNFT.mint(bob, 0);

        vm.startPrank(bob);
        myNFT.burn(0);

    }

}
