const OfferRepository = require('src/infra/repositories/offer')
const bitly = require('src/infra/thirdparty/bitly')
const { Offer } = require('src/domain/offer')
const beforeCreate = require('src/app/offer/hooks')
const { addBitlyToLinks } = require('src/app/offer/bitly-offer-service')

const create = async ({ id, body }) => {
  if (!Array.isArray(body)) {
    body = [body]
  }
  for await (let offer of body) {
    try {
      let domain = beforeCreate.mapOffer(Offer(offer))
      domain = await addBitlyToLinks(domain, id)
      await OfferRepository.create(domain)
      // await OfferRepository.updateLinks(id, domain.links)
    } catch (error) {
      throw error
    }
  }
  return body
}

module.exports = {
  create
}
