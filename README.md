# 24-frontend-workshop-contract-template

This is a template for the 24 frontend workshop contract.

## Getting Started

1. Clone the repository and navigate to the project directory:

```sh
$ git clone https://github.com/24-hack/24-frontend-workshop-contract-template.git
$ cd 24-frontend-workshop-contract-template
```

2. Install dependencies using `pnpm`:

   If you do not have `pnpm` installed, you can install it using the following command:

   ```sh
   $ npm install -g pnpm
   ```

   Using `pnpm`:

   ```sh
   $ pnpm install
   ```

3. Build the contracts:

```sh
$ forge build
```

4. Deploy the contracts:

   If you did not set up a MNEMONIC environment variable, you can use the `--private-key` flag to deploy the contracts.

   For general deployment:

   ```sh
   forge script script/Deploy.s.sol \
       --rpc-url <RPC_URL> \
       --private-key <PRIVATE_KEY> \
       --etherscan-api-key <ETHERSCAN_API_KEY> \
       --verify --verifier-url <VERIFIER_URL> --broadcast \
       --sig "run()" -vvv
   ```

   Example using the Zircuit chain:

   ```sh
   forge script script/Deploy.s.sol \
       --rpc-url zircuit \
       --legacy \
       --broadcast \
       --sig "run()" -vvv
   ```

5. Verify the contracts:

   To verify your contracts, use the following command:

   ```sh
   forge verify-contract \
       --verifier-url <VERIFIER_URL> \
       <deployed-contract-address> \
       <source-file>:<contract-name> \
       --etherscan-api-key <ETHERSCAN_API_KEY>
   ```

   Example for Zircuit chain:

   ```sh
   forge verify-contract \
       --verifier-url https://explorer.zircuit.com/api/contractVerifyHardhat \
       <deployed-mock-erc20-address> \
       src/MockERC20.sol:MockERC20 \
       --etherscan-api-key <ZIRCUIT-API-KEY>
   ```

   ```sh
   forge verify-contract \
       --verifier-url https://explorer.zircuit.com/api/contractVerifyHardhat \
       <deployed-xue-membership-nft-address> \
       src/XueMembershipNFT.sol:XueMembershipNFT \
       --etherscan-api-key <ZIRCUIT-API-KEY> \
       --constructor-args $(cast abi-encode "constructor(string)" "https://xuedaoisgood.com/")
   ```

## Common Usage

This is a list of the most frequently needed commands.

### Build

Build the contracts:

```sh
$ forge build
```

### Clean

Delete the build artifacts and cache directories:

```sh
$ forge clean
```

### Compile

Compile the contracts:

```sh
$ forge build
```

### Coverage

Get a test coverage report:

```sh
$ forge coverage
```

### Deploy

Deploy to Anvil:

```sh
$ forge script script/Deploy.s.sol --broadcast --fork-url http://localhost:8545
```

For this script to work, you need to have a `MNEMONIC` environment variable set to a valid
[BIP39 mnemonic](https://iancoleman.io/bip39/).

For instructions on how to deploy to a testnet or mainnet, check out the
[Solidity Scripting](https://book.getfoundry.sh/tutorials/solidity-scripting.html) tutorial.

### Format

Format the contracts:

```sh
$ forge fmt
```

### Gas Usage

Get a gas report:

```sh
$ forge test --gas-report
```

### Test

Run the tests:

```sh
$ forge test
```

Generate test coverage and output result to the terminal:

```sh
$ pnpm test:coverage
```

## Related Efforts

- [abigger87/femplate](https://github.com/abigger87/femplate)
- [cleanunicorn/ethereum-smartcontract-template](https://github.com/cleanunicorn/ethereum-smartcontract-template)
- [foundry-rs/forge-template](https://github.com/foundry-rs/forge-template)
- [FrankieIsLost/forge-template](https://github.com/FrankieIsLost/forge-template)

## License

This project is licensed under MIT.
