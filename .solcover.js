module.exports = {
    testCommand: 'node --max-old-space-size=4096 ./node_modules/.bin/truffle test --network coverage',
    compileCommand: 'node --max-old-space-size=4096 ./node_modules/.bin/truffle compile --network coverage',
    skipFiles: ['Migrations.sol', 'mocks', 'deployed'],
    copyPackages: ['openzeppelin-solidity'],
    client: require("ganache-cli"),
}
