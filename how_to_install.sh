git submodule init && git submodule update

yarn config set registry https://registry.npm.taobao.org

yarn install

# yarn test
npx ganache-cli -l 0x8954400 --allowUnlimitedContractSize -k istanbul >/dev/null &

npx truffle test


########
### how to run test coverage
npx truffle run coverage

### 可以记笔记了 !!! 点击 . 键 就可以打开网页版的 VSCode