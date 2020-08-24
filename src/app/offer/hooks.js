const mapOffer = (domain) => {
  if (domain.raffleStart  === undefined) {
    domain.raffleStart = null;
  }
  if (domain.raffleEnd  === undefined) {
    domain.raffleEnd = null;
  }
  if (domain.releaseTime  === undefined) {
    domain.releaseTime = null;
  }
  if (domain.priceUSD  === undefined) {
    domain.priceUSD = null;
  }
  if (domain.priceEUR === undefined) {
    domain.priceEUR = null;
  }
  if (domain.priceGBP  === undefined) {
    domain.priceGBP = null;
  }
  return domain;
}

module.exports = {
  mapOffer
}
