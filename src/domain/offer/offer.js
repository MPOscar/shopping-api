const t = require('tcomb')

const Offer = t.struct({
  releaseId: t.String,
  shopId: t.maybe(t.String),
  offerDate: t.maybe(t.Date),
  priceUSD: t.maybe(t.Number),
  priceGBP: t.maybe(t.Number),
  priceEUR: t.maybe(t.Number),
  salePercentage: t.maybe(t.Number),
  currency: t.maybe(t.String),
  status: t.enums.of(['sold_out', 'available', 'on_sale', 'unavailable', 'restock', 'coming_soon', 'live', 'closed']),
  shipping: t.maybe(t.enums.of([
    'worldwide',
    'unavailable',
    'Worldwide',
    'Europe',
    'USA',
    'Select Countries',
    'Worldwide Shipping',
    'Shipping to US only',
    'Shipping to EU only',
    'Local Shipping',
    'Instore pick-up'
  ])),
  countries: t.maybe(t.String),
  links: t.maybe(t.list(t.Object)),
  raffle: t.Boolean,
  raffleStart: t.maybe(t.Date),
  raffleEnd: t.maybe(t.Date),
  releaseTime: t.maybe(t.Date),
  displayWhatsNew: t.maybe(t.Boolean),
  displayOnSale: t.maybe(t.Boolean),
  release: t.maybe(t.Object),
  timezone: t.maybe(t.enums.of(['CET', 'ET', 'BST']))
}, {
  defaultProps: {
    timezone: 'CET',
    displayWhatsNew: false,
    displayOnSale: false,
    links: []
  }
})

module.exports = Offer
