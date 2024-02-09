pragma solidity ^0.8.0;

import "forge-std/Script.sol";

contract DeployMultiCall is Script {
    address constant DEPLOYER = 0x9775137314fE595c943712B0b336327dfa80aE8A;
    address constant EXPECTED_MULTICALL_ADDRESS = 0x8ae01fCF7c655655fF2c6Ef907b8B4718Ab4e17c;
    address constant DETERMINISTIC_DEPLOYER = 0x4e59b44847b379578588920cA78FbF26c0B4956C;
    function run() public {
        uint256 key = vm.envUint("DEPLOYER_PRIVATE_KEY");
        vm.startBroadcast(key);
        if(EXPECTED_MULTICALL_ADDRESS.code.length == 0) {
            (bool success, bytes memory ret) = DETERMINISTIC_DEPLOYER.call(hex"000000000000000000000000000000000000000000000000000000000000000060a060405234801561001057600080fd5b50306080526080516102bd61002f6000396000604f01526102bd6000f3fe60806040526004361061001e5760003560e01c80638d80ff0a14610023575b600080fd5b6100366100313660046101b8565b610038565b005b73ffffffffffffffffffffffffffffffffffffffff7f0000000000000000000000000000000000000000000000000000000000000000163003610101576040517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152603060248201527f4d756c746953656e642073686f756c64206f6e6c792062652063616c6c65642060448201527f7669612064656c656761746563616c6c00000000000000000000000000000000606482015260840160405180910390fd5b805160205b81811015610184578083015160f81c6001820184015160601c60158301850151603584018601516055850187016000856000811461014b576001811461015b57610166565b6000808585888a5af19150610166565b6000808585895af491505b508061017157600080fd5b5050806055018501945050505050610106565b505050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b6000602082840312156101ca57600080fd5b813567ffffffffffffffff808211156101e257600080fd5b818401915084601f8301126101f657600080fd5b81358181111561020857610208610189565b604051601f82017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0908116603f0116810190838211818310171561024e5761024e610189565b8160405282815287602084870101111561026757600080fd5b82602086016020830137600092810160200192909252509594505050505056fea2646970667358221220aee0f2dd047c52784b9c7806e4078197141e146ec66587d8610576db5f8ad20e64736f6c634300080f0033");
        } else {
            console.log("validator address: %s", EXPECTED_MULTICALL_ADDRESS);
        }
        vm.stopBroadcast();
    }
}

