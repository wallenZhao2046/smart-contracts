/* eslint-disable */
/**
 * ts-node scripts/deploy_truefi_upgrades.ts "{private_key}" "{network}"
 */
import { ethers, providers } from 'ethers'
import { TrueFiPoolFactory } from '../build/types'
import { TrueRatingAgencyFactory } from '../build/types'

async function deploy() {
  await deployUpgrades().catch(console.error)
}

async function deployUpgrades () {
  // 50_000_000_000
  const txnArgs = { gasLimit: 4_500_000, gasPrice: 50_000_000_000 }
  const provider = new providers.InfuraProvider(process.argv[3], '81447a33c1cd4eb09efb1e8c388fb28e')
  const wallet = new ethers.Wallet(process.argv[2], provider)

  const pool = await (await new TrueFiPoolFactory(wallet).deploy(txnArgs)).deployed()
  console.log('truefi pool address: ', pool.address)

  const ratingAgency = await (await new TrueRatingAgencyFactory(wallet).deploy(txnArgs)).deployed()
  console.log('rating agency address: ', ratingAgency.address)
}

deploy().catch(console.error)
