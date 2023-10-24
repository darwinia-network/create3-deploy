.PHONY: all fmt clean test
.PHONY: tools foundry sync salt

-include .env

all    :; @forge build --force
fmt    :; @forge fmt
clean  :; @forge clean
test   :; @forge test
deploy :; @forge script script/Deploy.s.sol:Deploy --chain-id ${chain-id} --broadcast --verify

sync   :; @git submodule update --recursive

tools  :  foundry
foundry:; curl -L https://foundry.paradigm.xyz | bash

salt   :; @bash ./bin/salt.sh
