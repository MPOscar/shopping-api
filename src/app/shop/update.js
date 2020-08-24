const repository = require('src/infra/repositories/shop')
const offersRepository = require('src/infra/repositories/offer')
const { Shop } = require('src/domain/shop')
const bitly = require('src/infra/thirdparty/bitly')

const applyLink = async (shop, link) => {
  const trackedUrl = shop.trackingListBaseUrl + encodeURI(link.url)
  const toUpdate = { trackedUrl }
  try {
    const bitlyUrl = await bitly.shortify(trackedUrl)
    if (bitlyUrl && bitlyUrl.deeplink && bitlyUrl.deeplink.url) {
      toUpdate.bitlyUrl = bitlyUrl.deeplink.url
    }
  } catch (ex) { }
  return toUpdate
}

const update = ({ id, body }) => {
  return new Promise(async (resolve, reject) => {
    try {
      const domain = Shop(body)
      const oldShop = await repository.getById(id)
      domain.slug = domain.name.toLowerCase().replace(/\s+/g, '-')
      await repository.updateShop(id, domain)

      // Only recompute bitly tracked urls if the trackingListbaseUrl has changed
      if (domain.trackingListBaseUrl && oldShop.trackingListBaseUrl !== domain.trackingListBaseUrl) {
        oldShop.trackingListBaseUrl = domain.trackingListBaseUrl
        await offersRepository.updateShopLinks(oldShop, applyLink)
      }

      resolve(domain)
    } catch (error) {
      reject(error)
    }
  })
}

module.exports = {
  update
}
