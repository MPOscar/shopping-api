const repository = require('src/infra/repositories/deal')
const { Deal } = require('src/domain/deal')
const bitly = require('src/infra/thirdparty/bitly')

const shortenUrl = async (url) => {
  try {
    const bitlyUrl = await bitly.shortify(url)
    if (bitlyUrl && bitlyUrl.deeplink && bitlyUrl.deeplink.url) {
      return bitlyUrl.deeplink.url
    }
  } catch (ex) {
    return null
  }
}

const beforeCreate = async (domain) => {
  if (domain.trackedUrl && domain.trackedUrl !== '') {
    const bitly = await shortenUrl(domain.trackedUrl)
    if (bitly) {
      domain.bitlyUrl = bitly
    }
  }
  return domain
}

const beforeUpdate = async (domain, { id }) => {
  const oldDeal = await repository.getById(id)
  if (domain.trackedUrl && domain.trackedUrl !== '' && oldDeal.trackedUrl !== domain.trackedUrl) {
    const bitly = await shortenUrl(domain.trackedUrl)
    if (bitly) {
      domain.bitlyUrl = bitly
    }
  }
  return domain
}

const attrs = ['id', 'createdAt', 'updatedAt', 'url' ,'bitlyUrl', 'trackedUrl' , 'salePercentage', 'status', 'shopId', 'displayOnSale', 'imgUrl', 'endDate', 'endTime', 'promoCode', ]

const {
  getOneUseCase,
  createUseCase,
  getAllUseCase,
  removeUseCase,
  updateUseCase
} = require('src/app/crud')(repository, Deal, attrs, {
  beforeCreate,
  beforeUpdate
})

const changeImageUrlUseCase = require('./change_image_url')
const getAllByShopUseCase = require('./get_all_by_shop')

module.exports = {
  changeImageUrlUseCase,
  getOneUseCase,
  createUseCase,
  getAllUseCase,
  removeUseCase,
  updateUseCase,
  getAllByShopUseCase
}
