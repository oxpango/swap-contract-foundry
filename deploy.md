source .env

forge script script/ABNB.s.sol:ABNBScript --broadcast --verify

forge verify-contract 0x26881B89029ED15e85786E56A95d255962784A59 ABNB --watch

forge script script/ABNB.s.sol:ABNBScript --broadcast

forge verify-contract 0x21fFe46c725825Aa64eA40F252cE6a153341B456 src/AUSDT.sol:AUSDT --watch

forge script script/ASwapV2.s.sol:ASwapV2Script --broadcast

forge verify-contract 0x2E70b8d4b4dD88F6bA95dC246035217e8292CFEE src/ASwapV2.sol:ASwapV2 --watch

forge script script/ABNB.s.sol:ABNBScript --broadcast

forge verify-contract 0x872F6733acde449790Fbbc3302d7208b194A5fB2 src/ABNB.sol:ABNB --watch

### AMAX

forge script script/AMAX.s.sol:AMAXScript --broadcast

forge verify-contract 0xc197fb8a1EAa3cE845E14e52D419F5125f41814E src/AMAX.sol:AMAX --watch
