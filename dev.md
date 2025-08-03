
## script

合约中代码可以操作上链

forge script script/Transfer.s.sol:TransferScript --broadcast

forge script script/ERC20Transfer.s.sol:ERC20TransferScript --broadcast

## test

合约中代码仅本地测试验证，不可以上链

forge test