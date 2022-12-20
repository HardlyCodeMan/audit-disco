		this.approve(address(this), INITIAL_SUPPLY);

		this.transferFrom(player, address(this), INITIAL_SUPPLY);


        contract.approve(player, INITIAL_SUPPLY);
        contract.transferFrom(player, contract, INITIAL_SUPPLY);