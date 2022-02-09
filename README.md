# Synthetic asset smart contract for the Liquid network


Synthetic assets are collateral-backed assets whose value fluctuates depending on a reference price. We propose a scheme where anyone can lock collateral on the Liquid Network to issue assets that track the price of a chosen real-world asset, such as dollars or stocks. The Elements enhanced scripting capabilities allow non-interactive redemption and liquidation when the collateral's value is underwater, with the possibility to top up the collateral to prevent liquidation.


Semi-formal description document is published with each [release](https://github.com/vulpemventures/synthetic-asset-smart-contract/releases).


## `TL;DR`

### Actors

- Issuer/Liquidator
- Sponsor
- Oracle


### Flow

1. **Issuer** mints an asset with zero supply (ie. `sTSLA`)
2. **Sponsor** locks collateral (ie. `USDt`) in the contract to mint the asset at current reference price, upon mutual agreement on liquidation target.
3. If value of collateral is underwater, **Issuer** can liquidate the upon burning the asset and presenting Oracle's singature on reference price.
4. **Sponsor** can prevent liquidation via collateral top-up in collaboration with issuer to create new contract.

NOTICE: **Sponsor** can always redeem at all times in a non-interactive fashion his collateral, upon burning the asset and small payout to **Issuer**.



## How it works

![High Level Contract Interaction Funding & Redeem](./images/Funding-Redeem.png)
![High Level Contract Interaction Liquidation](./images/Liquidation.png)
![High Level Contract Interaction Topup](./images/Topup.png)
