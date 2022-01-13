git submodule init && git submodule update

yarn config set registry https://registry.npm.taobao.org

yarn install

# yarn test
npx ganache-cli -l 0x8954400 --allowUnlimitedContractSize -k istanbul >/dev/null &

npx truffle test
