.PHONY: all fmt clean test
.PHONY: tools foundry sync

-include .env

all    :; @forge build --force
fmt    :; @forge fmt
clean  :; @forge clean
test   :; @forge test

sync   :; @git submodule update --recursive

tools  :  foundry
foundry:; curl -L https://foundry.paradigm.xyz | bash
