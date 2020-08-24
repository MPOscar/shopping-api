const releaseRepository = require('src/infra/repositories/release')
const { Release } = require('src/domain/release')
const EntityUniqueConstrainError = require('src/infra/errors/EntityAlreadyExists')

const beforeUpdate = (domain) => {
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
}

const update = ({ id, body }) => {
  return new Promise(async (resolve, reject) => {
    try {
      const domain = Release(body)

      const oldRelease = await releaseRepository.getById(id)

      beforeUpdate(domain, {id})

      await releaseRepository.update(domain, id)

      let newUpdatedAt = oldRelease.updatedAt
      if (domain.updatedAt) {
        newUpdatedAt = domain.updatedAt
      }
      await releaseRepository.modifyUpdatedAt(id, newUpdatedAt)

      resolve(domain)
    } catch (error) {
      reject(error)
    }
  })
}

module.exports = {
  update
}
