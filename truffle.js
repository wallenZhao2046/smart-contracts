require('babel-register');
require('babel-polyfill');

var HDWalletProvider = require("truffle-hdwallet-provider");

module.exports = {
  compilers: {
    solc: {
      version: "0.6.10",
      evmVersion: "istanbul",
      optimizer: {
        enabled: true,
        runs: 20000
      }
    },
  },
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      //gas: 7990000,
      gas: 144000000,
      gasPrice: 0x01, // Specified in Wei
      network_id: "*" // Match any network id
    },
    ropsten: {
      provider: new HDWalletProvider(process.env.MNEMONIC, "https://ropsten.infura.io/v3/4851451615244f39b965503cadbb0fef"),
      network_id: "3",
      gas: 7990000,
      gasPrice: 22000000000 // Specified in Wei
    },
    kovan: {
      provider: new HDWalletProvider(process.env.MNEMONIC, "https://kovan.infura.io/v3/4851451615244f39b965503cadbb0fef"),
      network_id: "42",
      gas: 7200000,
      gasPrice: 22000000000 // Specified in Wei
    },
    coverage: {
      host: "127.0.0.1",
      network_id: "*",
      port: 8545,
      gas: 144000000,
      gasPrice: 0x01,
    },
    rinkeby: {
      provider: new HDWalletProvider(process.env.MNEMONIC, "https://rinkeby.infura.io/v3/4851451615244f39b965503cadbb0fef"),
      network_id: "4",
      gas: 7200000,
      gasPrice: 22000000000 // Specified in Wei
    },
    production: {
      provider: new HDWalletProvider(process.env.MNEMONIC, "https://mainnet.infura.io/v3/4851451615244f39b965503cadbb0fef "),
      network_id: "1",
      gas: 7990000,
      gasPrice: 7000000000
    },
  },
  plugins: ["solidity-coverage"]
};
