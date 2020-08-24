const t = require('tcomb')
const ReleaseImage = require('./release_image')
const Entity = require('../entity')

const Release = t.struct({
  sku: t.String,
  name: t.String,
  description: t.String,
  images: t.maybe(t.list(Entity.extend(ReleaseImage))),
  mainImage: t.maybe(t.String),
  releaseDate: t.maybe(t.Date),
  color: t.maybe(t.String),
  supplierColor: t.maybe(t.String),
  hot: t.Boolean,
  hiddenDashboard: t.maybe(t.Boolean),
  customized: t.Boolean,
  currency: t.maybe(t.String),
  children: t.maybe(t.Boolean),
  priceUSD: t.maybe(t.Number),
  priceGBP: t.maybe(t.Number),
  priceEUR: t.maybe(t.Number),
  slug: t.maybe(t.String),
  gender: t.maybe(t.String),
  styleId: t.maybe(t.String),
  brandId: t.maybe(t.String), // gotten from style
  collectionId: t.maybe(t.String),
  status: t.maybe(t.String) // gotten from offer
}, {
  defaultProps: {
    hiddenDashboard: false,
    customized: false,
    description: '',
    hot: false
  }
})

module.exports = Release
