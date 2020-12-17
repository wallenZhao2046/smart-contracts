import { expect, use } from 'chai'
import { constants, providers, BigNumberish, BigNumber, Wallet, ethers } from 'ethers'
import { solidity } from 'ethereum-waffle'

import { setupDeploy } from 'scripts/utils'

import {
  beforeEachWithFixture,
  parseTRU,
} from 'utils'

import {
  TrustTokenFactory,
  TrustToken,
  TimelockFactory,
  Timelock,
  GovernorAlphaFactory,
  GovernorAlpha
} from 'contracts'

use(solidity)

describe('GovernorAlpha', () => {
  let owner: Wallet, timeLockRegistry: Wallet, saftHolder: Wallet, initialHolder: Wallet, secondAccount: Wallet, thirdAccount: Wallet, fourthAccount: Wallet
  let timelock: Timelock
  let governorAlpha: GovernorAlpha
  let trustToken: TrustToken
  let provider: providers.JsonRpcProvider
  let target, values, signatures, callDatas, description

  beforeEachWithFixture(async (wallets, _provider) => {
    ([owner, timeLockRegistry, saftHolder, initialHolder, secondAccount, thirdAccount, fourthAccount] = wallets)
    provider = _provider
    const deployContract = setupDeploy(owner)
    
    timelock = await deployContract(TimelockFactory,owner.address,2*24*60*60) //set delay = 2days 
    trustToken = await deployContract(TrustTokenFactory)

    governorAlpha = await deployContract(GovernorAlphaFactory,timelock.address,trustToken.address,owner.address)

    await trustToken.mint(initialHolder.address,parseTRU(14500000*5)) // 5% of tru
    await trustToken.connect(initialHolder).delegate(initialHolder.address) // delegate itself

    target = [secondAccount.address]
    values = ['0']
    signatures = ['getBalanceOf(address)']
    callDatas = [encodeParameters(['address'],[thirdAccount.address])]
    description = 'test proposal'
  })


  describe('propose', () => {
    describe('get proposal ID', () => {
      it('returns id equals to 1', async () => {
        await governorAlpha.connect(initialHolder).propose(target,values,signatures,callDatas,description)
        expect(await governorAlpha.latestProposalIds(initialHolder.address)).to.eq(1)
      })
    })
  })
  describe('cancel', () => {
    describe('cancel a proposal', () => {
      it('returns proposalCount equals to 0', async () => {
        // await governorAlpha.connect(initialHolder).propose(target,values,signatures,callDatas,description)
        // await governorAlpha.connect(owner).cancel(1) //gudian can cancel a proposal
        // expect(await governorAlpha.proposalCount()).to.eq(0)
      })
    })
  })
  describe('queue', () => {
    describe('send to queue', () => {
      it('returns id equals to 1', async () => {
        // await governorAlpha.connect(initialHolder).propose(target,values,signatures,callDatas,description)
        // await governorAlpha.queue(1)
        // console.log(await governorAlpha.state(1))
      })
    })
  })


})

function encodeParameters(types, values) {
  const abi = new ethers.utils.AbiCoder();
  return abi.encode(types, values);
}