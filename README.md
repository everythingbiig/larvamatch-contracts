# LarvaMatch Contracts
A contract to store metadata that allows us to find punks that look like larvas, and vice versa.

## Design
Save a mapping that is determined externally.  That is, the computation to determine which punks look like larvas and vice versa will be done externally and imported via the `savePunkMatchesForLarva()` and `saveLarvaMatchesForPunk()` contract functions.

### An alternative
Another potential design is to use the larva and punk's trait metadata to determine the mapping.

It may even be possible to perform this metadata querying directly from the LarvaLad token's tokenURI and iterate over the punks' traits.  This could be done in batches with a new contract method.

Butttt... this is likely to be a VERY expensive on-chain calculation, and the trait metadata is never to change so why bother.

## Interacting with the LarvaMatch Contract
This has been tested using `truffle console`.

### Adding a mapping
Running
```node
instance.savePunkMatchesForLarva(1966,[4382,6145])
```
should output something like
```node
truffle(development)> instance.savePunkMatchesForLarva(1966,[4382,6145])
{
  tx: '0xf3dc3d64d9db115e691c57f683299cd0cc049007f9d92ad18991c4b2f0c7f055',
  receipt: {
    transactionHash: '0xf3dc3d64d9db115e691c57f683299cd0cc049007f9d92ad18991c4b2f0c7f055',
```
### Finding a match
After saving a mapping, you can use it by running 
```node
instance.findMyPunks(1966)
```
and you should get something like
```node
truffle(development)> instance.findMyPunks(1966)
[
  BN {
    negative: 0,
    words: [ 4382, <1 empty item> ],
    length: 1,
    red: null
```
## TODO
- Add tests
- Write script to import all mappings
- Deploy this bish (first to goerli then mainnet)


