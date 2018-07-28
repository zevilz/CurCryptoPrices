# CurCryptoPrices

The script gets current cryptocurrencies prices from [cryptocompare.com](https://min-api.cryptocompare.com/) and write in file.

Data structure in file like below:
```bash
{"BTC":{"USD":8172.9,"BTC":1,"RUB":506409.2},"ETH":{"USD":467.49,"BTC":0.05718,"RUB":28956.48},"XRP":{"USD":0.4521,"BTC":0.00005533,"RUB":28.12},"BCH":{"USD":819.93,"BTC":0.1002,"RUB":50742.2}}
```

# API info
Caching: 10 seconds.
Rate limits: hour limit - 100000, minute limit - 2000, second limit - 50.

Tested only on Debian 9.x

## TODO
- [] update docs
- [] test script on others distributions and systems
- [] add options
- [] add support for run script more than one time per 1 minute via cron
- [] update TODO :)

## Changelog
- 2018.07.28 - 0.1.0 - beta released
