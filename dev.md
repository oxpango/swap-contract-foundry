
## script

合约中代码可以操作上链

链上交易（cast send 或 forge script --broadcast）

上链，广播到 BSC 测试网，有 tx hash，可在 BscScan 查询

forge script script/Transfer.s.sol:TransferScript --broadcast

forge script script/ERC20Transfer.s.sol:ERC20TransferScript --broadcast

## test

合约中代码仅本地测试验证，不可以上链

本地分叉（默认 forge test）

不上链，仅在本地模拟，无真实 tx hash

forge test