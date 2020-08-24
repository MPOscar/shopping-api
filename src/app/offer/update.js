const OfferRepository = require('src/infra/repositories/offer')
const { Offer } = require('src/domain/offer')
const beforeUpdate = require('src/app/offer/hooks')
const { addBitlyToLinks } = require('src/app/offer/bitly-offer-service')

const update = ({ id, body }) => {
  return new Promise(async (resolve, reject) => {
    try {
      let domain = beforeUpdate.mapOffer(Offer(body))
      domain = await addBitlyToLinks(domain, id)

      await OfferRepository.update(domain, id)
      await OfferRepository.updateLinks(id, domain.links)
      resolve(domain)
    } catch (error) {
      reject(error)
    }
  })
}

module.exports = {
  update
}
