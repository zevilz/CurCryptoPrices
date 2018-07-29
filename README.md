# CurCryptoPrices

The script gets current cryptocurrencies prices from [cryptocompare.com](https://min-api.cryptocompare.com/) and write in file.

Data structure in file like below:
```bash
{"BTC":{"USD":8172.9,"RUB":506409.2},"ETH":{"USD":467.49,"RUB":28956.48},"XRP":{"USD":0.4521,"RUB":28.12}}
```

Tested only on Debian 9.x

## API info
- Caching: 10 seconds.
- Rate limits: hour limit - 100000, minute limit - 2000, second limit - 50.

## TODO
- [ ] update docs
- [ ] test script on others distributions and systems
- [ ] add options
- [x] add support for run script more than one time per 1 minute via cron
- [ ] update TODO :)

## Changelog
- 2018.07.29 - 0.2.0 - added support for iterations and iterations delay for run script more than one time per 1 minute via cron, some fixes
- 2018.07.28 - 0.1.0 - beta released
