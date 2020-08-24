const releaseRepository = require('src/infra/repositories/release')
const { Release } = require('src/domain/release')
const EntityUniqueConstrainError = require('src/infra/errors/EntityAlreadyExists')

const beforeCreate = (domain) => {
  if (domain.releaseDate === undefined) {
    domain.releaseDate = null
  }
  if (domain.priceUSD === undefined) {
    domain.priceUSD = null
  }
  if (domain.priceEUR === undefined) {
    domain.priceEUR = null
  }
  if (domain.priceGBP === undefined) {
    domain.priceGBP = null
  }
  domain.slug = domain.name
  if (domain.sku) {
    domain.slug += ('-' + domain.sku)
  }
  domain.slug = domain.slug.toLowerCase()
  domain.slug = domain.slug.replace(/ +/g, '-')
  domain.slug = domain.slug.replace(/[^a-zA-Z0-9\-]/g, '')
  domain.slug = domain.slug.trim()
  return domain
}

const create = ({ body }) => {
  return Promise
    .resolve()
    .then(() => {
      let domain = Release(body)
      domain = beforeCreate(domain)
      return releaseRepository.countLikeReleases(domain.slug)
        .then(count => {
          if (count) {
            domain.slug += ('-' + count)
          }
          return releaseRepository.create(domain)
        })
    })
    .catch(error => {
      if (error.name && error.name === 'SequelizeUniqueConstraintError') {
        throw new EntityUniqueConstrainError()
      }
      throw new Error(error)
    })
}

module.exports = {
  create
}
