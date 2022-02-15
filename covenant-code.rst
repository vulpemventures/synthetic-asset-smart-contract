Redeem covenant case
~~~~~~~~~~~~~~~~~~~~


.. code::

   // stack:
   //    sponsor_signature
   OP_0

   // stack:
   //    0
   //    sponsor_signature
   OP_INSPECTOUTPUTASSET

   // stack:
   //    output_asset_prefix
   //    output_asset_id
   //    sponsor_signature
   OP_1,  // check that the asset is explicit

   // stack:
   //    1
   //    output_asset_prefix
   //    output_asset_id
   //    sponsor_signature
   OP_EQUALVERIFY,

   // stack:
   //    output_0_asset_id
   //    sponsor_signature
   DATA(<synth_asset_id>)

   // stack:
   //    synth_asset_id
   //    output_0_asset_id
   //    sponsor_signature
   OP_EQUALVERIFY

   // We checked that the asset id of the output at index 0 is equal to the synth asset id
   // encoded in the covenant at the contract setup phase

   // stack:
   //    sponsor_signature
   OP_0

   // stack:
   //    0
   //    sponsor_signature
   OP_INSPECTOUTPUTVALUE

   // stack:
   //    output_value_prefix
   //    output_value
   //    sponsor_signature
   OP_1,  // check that the value is explicit

   // stack:
   //    1
   //    output_value_prefix
   //    output_value
   //    sponsor_signature
   OP_EQUALVERIFY,

   // stack:
   //    output_0_value
   //    sponsor_signature
   DATA(<synth_asset_amount_to_burn_64bit>)   // amount as encoded in the output (8 bytes)

   // stack:
   //    synth_asset_amount_to_burn_64bit
   //    output_0_value
   //    sponsor_signature
   OP_EQUALVERIFY

   // We checked that the value of the output at index 0 is equal to the amount of
   // synth that must be burned

   // stack:
   //    sponsor_signature
   OP_0

   // stack:
   //    0
   //    sponsor_signature
   OP_INSPECTOUTPUTSCRIPTPUBKEY

   // stack:
   //    output_0_scriptPubKey_witVersion
   //    output_0_scriptPubKey_info
   //    sponsor_signature
   -1,  // OP_RETURN is not a witness scriptPubKey, so its version will be -1

   // stack:
   //    -1
   //    output_0_scriptPubKey_witVersion
   //    output_0_scriptPubKey_info
   //    sponsor_signature
   OP_EQUALVERIFY,

   // The scriptpubkey info will be SHA256(scriptPubKey) if witVersion is -1

   // stack:
   //    output_0_scriptPubKey_info
   //    sponsor_signature
   DATA(SHA256(OP_RETURN))

   // stack:
   //    SHA256(OP_RETURN)
   //    output_0_scriptPubKey_info
   //    sponsor_signature
   OP_EQUALVERIFY

   // We checked that the scriptPubKey of the output at index 0 is equal to OP_RETURN

   // stack:
   //    sponsor_signature
   OP_0

   // stack:
   //    0
   //    sponsor_signature
   OP_INSPECTOUTPUTNONCE

   // stack:
   //    output_0_nonce
   //    sponsor_signature
   OP_0

   // stack:
   //    0  // equivalent to empty data array
   //    output_0_nonce
   //    sponsor_signature
   OP_EQUALVERIFY

   // We checked that the nonce of the output at index 0 is equal to empty data array,
   // that means that the output is not confidential.
   //
   // While it seems to be impossible to grind the confidential output asset id and value
   // to match the values checked by the above code, checking that the nonce is empty
   // and thus the output is non-confidential closes even theoretical possibility, and
   // is also good to include for completeness, so we check all parts of the output.

   // (*) We checked that transaction output 0 is non-confidential and burns the expected
   // amount of Synth via sending it to the OP_RETURN script

   // stack:
   //    sponsor_signature
   OP_1

   // stack:
   //    1
   //    sponsor_signature
   OP_INSPECTOUTPUTASSET

   // stack:
   //    output_asset_prefix
   //    output_asset_id
   //    sponsor_signature
   OP_1,  // check that the asset is explicit

   // stack:
   //    1
   //    output_asset_prefix
   //    output_asset_id
   //    sponsor_signature
   OP_EQUALVERIFY,

   // stack:
   //    output_1_asset_id
   //    sponsor_signature
   DATA(<payout_asset_id>)

   // stack:
   //    payout_asset_id
   //    output_1_asset_id
   //    sponsor_signature
   OP_EQUALVERIFY

   // We checked that the asset id of the output at index 1 is equal to the payout asset id
   // encoded in the covenant at the contract setup phase

   // stack:
   //    sponsor_signature
   OP_1

   // stack:
   //    1
   //    sponsor_signature
   OP_INSPECTOUTPUTVALUE

   // stack:
   //    output_value_prefix
   //    output_value
   //    sponsor_signature
   OP_1,  // check that the value is explicit

   // stack:
   //    1
   //    output_value_prefix
   //    output_value
   //    sponsor_signature
   OP_EQUALVERIFY,

   // stack:
   //    output_1_value
   //    sponsor_signature
   DATA(<payout_amount_64bit>)     // amount as encoded in the output (8 bytes)

   // stack:
   //    payout_amount_64bit
   //    output_1_value
   //    sponsor_signature
   OP_EQUALVERIFY

   // We checked that the value of the output at index 1 is equal to the payout amount

   // stack:
   //    sponsor_signature
   OP_1

   // stack:
   //    1
   //    sponsor_signature
   OP_INSPECTOUTPUTSCRIPTPUBKEY

   // stack:
   //    output_1_scriptPubKey_witVersion
   //    output_1_scriptPubKey_info
   //    sponsor_signature
   OP_1,   // Assuming the issuer's address is P2TR

   // stack:
   //    1
   //    output_scriptPubKey_witVersion
   //    output_scriptPubKey_info
   //    sponsor_signature
   OP_EQUALVERIFY,

   // The scriptpubkey info will equal witness program if witVersion is 1

   // stack:
   //    output_1_scriptPubKey_info
   //    sponsor_signature
   DATA(<issuer_address_scriptPubKey_witProgram>)  // the address was generated using issuer's pubkey

   // stack:
   //    issuer_address_scriptPubKey_witProgram
   //    output_1_scriptPubKey_info
   //    sponsor_signature
   OP_EQUALVERIFY

   // We checked that the scriptPubKey of the output at index 1 is equal to scriptPubKey
   // of the issuer's address

   // stack:
   //    sponsor_signature
   OP_1

   // stack:
   //    1
   //    sponsor_signature
   OP_INSPECTOUTPUTNONCE

   // stack:
   //    output_1_nonce
   //    sponsor_signature
   OP_0

   // stack:
   //    0  // equivalent to empty data array
   //    output_1_nonce
   //    sponsor_signature
   OP_EQUALVERIFY

   // We checked that the nonce of the output at index 1 is equal to empty data array,
   // that means that the output is not confidential.

   // (*) We checked that transaction output at index 1 sends the expected payout amount to issuer

   // ------------------------------------------
   // LOCKUP_PERIOD_CHECK_CODE_START
   // ------------------------------------------
   //
   // This block of code can be omitted if lockup period duration is zero,
   // or the <lockup_period_timeout> can be set to the block before the contract
   // has been created.
   //
   // stack:
   //    sponsor_signature
   NUMBER(<lockup_period_timeout>)

   // stack:
   //    lockup_period_timeout
   //    sponsor_signature
   OP_CHECKSEQUENCEVERIFY

   // stack:
   //    lockup_period_timeout
   //    sponsor_signature
   OP_DROP

   // (*) We checked that the lock-up period has ended.
   //
   // ------------------------------------------
   // LOCKUP_PERIOD_CHECK_CODE_END
   // ------------------------------------------

   // stack:
   //    sponsor_signature
   DATA(<sponsor_pubkey>)

   // stack:
   //    sponsor_pubkey
   //    sponsor_signature
   OP_CHECKSIG

   // We used OP_CHECKSIG (non-VERIFY) because this is the end of the script. Cleanstack rule states
   // that successful execution of the script must leave a single true value on the stack.

   // (*) We checked that the transaction is authorized by sponsor.
   // It is expected that sponsor will not produce signatures
   // with sighash type different from the default type (equivalent in effect to SIGHASH_ALL),
   // so we do not check the type.
   //
   // In principle, we could check for the signature size. In taproot script,
   // schnorr signature with default hashtype will be exactly 64 bytes in length,
   // and any signature with different sighash type will be 65 bytes in length.




Liquidation covenant case
~~~~~~~~~~~~~~~~~~~~~~~~~


.. code::

   // stack:
   //    cur_price_level_le64
   //    time_of_oracle_sig_creation_le32
   //    oracle_signature
   //    issuer_signature
   OP_DUP

   // stack:
   //    cur_price_level_le64
   //    cur_price_level_le64
   //    time_of_oracle_sig_creation_le32
   //    oracle_signature
   //    issuer_signature
   DATA(<liquidation_price_le64>)

   // stack:
   //    liquidation_price_level_le64
   //    cur_price_level_le64
   //    cur_price_level_le64
   //    time_of_oracle_sig_creation_le32
   //    oracle_signature
   //    issuer_signature
   OP_LESSTHAN64

   // stack:
   //    "result of (cur_price_level_le64 < liquidation_price_level_le64)"
   //    cur_price_level_le64
   //    time_of_oracle_sig_creation_le32
   //    oracle_signature
   //    issuer_signature
   OP_VERIFY

   // (*) We checked that the current price level is below liquidation price level

   // stack:
   //    cur_price_level_le64
   //    time_of_oracle_sig_creation_le32
   //    oracle_signature
   //    issuer_signature
   OP_OVER

   // stack:
   //    time_of_oracle_sig_creation_le32
   //    cur_price_level_le64
   //    time_of_oracle_sig_creation_le32
   //    oracle_signature
   //    issuer_signature
   OP_LE32TOLE64

   // stack:
   //    time_of_oracle_sig_creation_le64
   //    cur_price_level_le64
   //    time_of_oracle_sig_creation_le32
   //    oracle_signature
   //    issuer_signature
   DATA(<time_of_contract_setup_le32>)

   // stack:
   //    time_of_contract_setup_le32
   //    time_of_oracle_sig_creation_le64
   //    cur_price_level_le64
   //    time_of_oracle_sig_creation_le32
   //    oracle_signature
   //    issuer_signature
   OP_LE32TOLE64

   // stack:
   //    time_of_contract_setup_le64
   //    time_of_oracle_sig_creation_le64
   //    cur_price_level_le64
   //    time_of_oracle_sig_creation_le32
   //    oracle_signature
   //    issuer_signature
   OP_GREATERTHANOREQUAL64

   // stack:
   //    "result of (time_of_oracle_sig_creation_le64 >= time_of_contract_setup_le64)"
   //    cur_price_level_le64
   //    time_of_oracle_sig_creation_le32
   //    oracle_signature
   //    issuer_signature
   OP_VERIFY

   // (*) We checked that the Oracle's signature was created after contract setup

   // stack:
   //    cur_price_level_le64
   //    time_of_oracle_sig_creation_le32
   //    oracle_signature
   //    issuer_signature
   OP_CAT

   // stack:
   //    price_data_block: DATA(<time_of_oracle_sig_creation_le32><cur_price_level_le64>)
   //    oracle_signature
   //    issuer_signature
   OP_SHA256

   // stack:
   //    SHA256(price_data_block)
   //    oracle_signature
   //    issuer_signature
   DATA(<oracle_pubkey>)

   // stack:
   //    oracle_pubkey
   //    SHA256(price_data_block)
   //    oracle_signature
   //    issuer_signature
   OP_CHECKSIGFROMSTACKVERIFY

   // (*) We checked that the 'price data block', that we created by concatenating
   // time_of_oracle_sig_creation and cur_price_level, is attested by the Oracle's signature.

   // stack:
   //    issuer_signature
   OP_0

   // stack:
   //    0
   //    issuer_signature
   OP_INSPECTOUTPUTASSET

   // stack:
   //    output_asset_prefix
   //    output_asset_id
   //    issuer_signature
   OP_1,  // check that the asset is explicit

   // stack:
   //    1
   //    output_asset_prefix
   //    output_asset_id
   //    issuer_signature
   OP_EQUALVERIFY,

   // stack:
   //    output_0_asset_id
   //    issuer_signature
   DATA(<synth_asset_id>)

   // stack:
   //    synth_asset_id
   //    output_0_asset_id
   //    issuer_signature
   OP_EQUALVERIFY

   // We checked that the asset id of the output at index 0 is equal to the synth asset id
   // encoded in the covenant at the contract setup phase

   // stack:
   //    issuer_signature
   OP_0

   // stack:
   //    0
   //    issuer_signature
   OP_INSPECTOUTPUTVALUE

   // stack:
   //    output_value_prefix
   //    output_value
   //    issuer_signature
   OP_1,  // check that the value is explicit

   // stack:
   //    1
   //    output_value_prefix
   //    output_value
   //    issuer_signature
   OP_EQUALVERIFY,

   // stack:
   //    output_0_value
   //    issuer_signature
   DATA(<synth_asset_amount_to_burn_64bit>)   // amount as encoded in the output (8 bytes)

   // stack:
   //    synth_asset_amount_to_burn_64bit
   //    output_0_value
   //    issuer_signature
   OP_EQUALVERIFY

   // We checked that the value of the output at index 0 is equal to the amount of
   // synth that must be burned

   // stack:
   //    issuer_signature
   OP_0

   // stack:
   //    0
   //    issuer_signature
   OP_INSPECTOUTPUTSCRIPTPUBKEY

   // stack:
   //    output_0_scriptPubKey_witVersion
   //    output_0_scriptPubKey_info
   //    issuer_signature
   -1,  // OP_RETURN is not a witness scriptPubKey, so its version will be -1

   // stack:
   //    -1
   //    output_0_scriptPubKey_witVersion
   //    output_0_scriptPubKey_info
   //    issuer_signature
   OP_EQUALVERIFY,

   // The scriptpubkey info will be SHA256(scriptPubKey) if witVersion is -1

   // stack:
   //    output_0_scriptPubKey_info
   //    issuer_signature
   DATA(SHA256(OP_RETURN))

   // stack:
   //    SHA256(OP_RETURN)
   //    output_0_scriptPubKey_info
   //    issuer_signature
   OP_EQUALVERIFY

   // We checked that the scriptPubKey of the output at index 0 is equal to OP_RETURN

   // stack:
   //    issuer_signature
   OP_0

   // stack:
   //    0
   //    issuer_signature
   OP_INSPECTOUTPUTNONCE

   // stack:
   //    output_0_nonce
   //    issuer_signature
   OP_0

   // stack:
   //    0  // equivalent to empty data array
   //    output_0_nonce
   //    issuer_signature
   OP_EQUALVERIFY

   // We checked that the nonce of the output at index 0 is equal to empty data array,
   // that means that the output is not confidential.

   // (*) We checked that transaction output 0 is non-confidential and burns the expected
   // amount of Synth via sending it to the OP_RETURN script


   // For the sake of brevity, we do not check here that output at index 1 sends
   // the full collateral to the issuer's cold storage address.
   // We recommend to implement this check though, as a defence-in-depth measure.

   // stack:
   //    issuer_signature
   DATA(<issuer_pubkey>)

   // stack:
   //    issuer_pubkey
   //    issuer_signature
   OP_CHECKSIG

   // We used OP_CHECKSIG (non-VERIFY) because this is the end of the script. Cleanstack rule states
   // that successful execution of the script must leave a single true value on the stack.

   // (*) We checked that the transaction is authorized by issuer.
   // It is expected that issuer will not produce signatures
   // with sighash type different from the default type (equivalent in effect to SIGHASH_ALL),
   // so we do not check the type.


Re-Issuance covenant case
~~~~~~~~~~~~~~~~~~~~~~~~~

.. code::

   // stack:
   //    issuer_signature
   //    sponsor_signature
   OP_0

   // stack:
   //    0
   //    issuer_signature
   //    sponsor_signature
   OP_INSPECTOUTPUTASSET

   // stack:
   //    output_asset_prefix
   //    output_asset_id
   //    issuer_signature
   //    sponsor_signature
   OP_1,  // check that the asset is explicit

   // stack:
   //    1
   //    output_asset_prefix
   //    output_asset_id
   //    issuer_signature
   //    sponsor_signature
   OP_EQUALVERIFY,

   // stack:
   //    output_0_asset_id
   //    issuer_signature
   //    sponsor_signature
   DATA(<synth_asset_id>)

   // stack:
   //    synth_asset_id
   //    output_0_asset_id
   //    issuer_signature
   //    sponsor_signature
   OP_EQUALVERIFY

   // We checked that the asset id of the output at index 0 is equal to the synth asset id
   // encoded in the covenant at the contract setup phase

   // stack:
   //    issuer_signature
   //    sponsor_signature
   OP_0

   // stack:
   //    0
   //    issuer_signature
   //    sponsor_signature
   OP_INSPECTOUTPUTVALUE

   // stack:
   //    output_value_prefix
   //    output_value
   //    issuer_signature
   //    sponsor_signature
   OP_1,  // check that the value is explicit

   // stack:
   //    1
   //    output_value_prefix
   //    output_value
   //    issuer_signature
   //    sponsor_signature
   OP_EQUALVERIFY,

   // stack:
   //    output_0_value
   //    issuer_signature
   //    sponsor_signature
   DATA(<synth_asset_amount_to_burn_64bit>)   // amount as encoded in the output (8 bytes)

   // stack:
   //    synth_asset_amount_to_burn_64bit
   //    output_0_value
   //    issuer_signature
   //    sponsor_signature
   OP_EQUALVERIFY

   // We checked that the value of the output at index 0 is equal to the amount of
   // synth that must be burned

   // stack:
   //    issuer_signature
   //    sponsor_signature
   OP_0

   // stack:
   //    0
   //    issuer_signature
   //    sponsor_signature
   OP_INSPECTOUTPUTSCRIPTPUBKEY

   // stack:
   //    output_0_scriptPubKey_witVersion
   //    output_0_scriptPubKey_info
   //    issuer_signature
   //    sponsor_signature
   -1,  // OP_RETURN is not a witness scriptPubKey, so its version will be -1

   // stack:
   //    -1
   //    output_0_scriptPubKey_witVersion
   //    output_0_scriptPubKey_info
   //    issuer_signature
   //    sponsor_signature
   OP_EQUALVERIFY,

   // The scriptpubkey info will be SHA256(scriptPubKey) if witVersion is -1

   // stack:
   //    output_0_scriptPubKey_info
   //    issuer_signature
   //    sponsor_signature
   DATA(SHA256(OP_RETURN))

   // stack:
   //    SHA256(OP_RETURN)
   //    output_0_scriptPubKey_info
   //    issuer_signature
   //    sponsor_signature
   OP_EQUALVERIFY

   // We checked that the scriptPubKey of the output at index 0 is equal to OP_RETURN

   // stack:
   //    issuer_signature
   //    sponsor_signature
   OP_0

   // stack:
   //    0
   //    issuer_signature
   //    sponsor_signature
   OP_INSPECTOUTPUTNONCE

   // stack:
   //    output_0_nonce
   //    issuer_signature
   //    sponsor_signature
   OP_0

   // stack:
   //    0  // equivalent to empty data array
   //    output_0_nonce
   //    issuer_signature
   //    sponsor_signature
   OP_EQUALVERIFY

   // We checked that the nonce of the output at index 0 is equal to empty data array,
   // that means that the output is not confidential.

   // (*) We checked that transaction output 0 is non-confidential and burns the expected
   // amount of Synth via sending it to the OP_RETURN script

   // stack:
   //    issuer_signature
   //    sponsor_signature
   DATA(<issuer_pubkey>)

   // stack:
   //    issuer_pubkey
   //    issuer_signature
   //    sponsor_signature
   OP_CHECKSIGVERIFY

   // (*) We checked that the transaction is authorized by issuer.
   // It is expected that issuer will not produce signatures
   // with sighash type different from default (equivalent in effect to SIGHASH_ALL),
   // so we do not check the type.

   // stack:
   //    sponsor_signature
   DATA(<sponsor_pubkey>)

   // stack:
   //    sponsor_pubkey
   //    sponsor_signature
   OP_CHECKSIG

   // We used OP_CHECKSIG (non-VERIFY) because this is the end of the script. Cleanstack rule states
   // that successful execution of the script must leave a single true value on the stack.

   // (*) We checked that the transaction is authorized by sponsor.
   // It is expected that issuer will not produce signatures
   // with sighash type different from default (equivalent in effect to SIGHASH_ALL),
   // so we do not check the type.

