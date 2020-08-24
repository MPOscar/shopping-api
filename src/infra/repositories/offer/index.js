const { Offer } = require('src/domain/offer')
const BaseRepository = require('../base_repository')
const container = require('src/container') // we have to get the DI
const EntityNotFound = require('src/infra/errors/EntityNotFoundError')
// inject database
const { database } = container.cradle
const model = database.models.offers
const offersLinksModel = database.models.offer_links
const releasesModel = database.models.releases
const styleModel = database.models.styles
const shopsModel = database.models.shops
const categoriesModel = database.models.categories
const Sequelize = require('sequelize')
const Op = Sequelize.Op

const createOptions = {
  include: [{
    model: offersLinksModel,
    as: 'links'
  }]
}
const updateOptions = createOptions

const getOptionsCallback = (params) => {
  if (params.order) {
    params.order.forEach((param, ind) => {
      if (param[0] === 'hot') {
        params.order[ind].unshift({ model: releasesModel, as: 'release' })
      }
    })
  }
  return {
    include: [{
      model: releasesModel,
      as: 'release',
      attributes: ['id', 'sku', 'collectionId', 'styleId', 'hot'],
      required: true,
      include: [{
        model: styleModel,
        as: 'style',
        attributes: ['id', ['category', 'categoryId'], ['brand', 'brandId']],
        required: true,
        include: [{
          model: categoriesModel,
          as: 'categories'
        }]
      }]
    }, {
      model: offersLinksModel,
      as: 'links'
    }, {
      model: shopsModel,
      as: 'shop'
    }],
    distinct: true,
    subQuery: false
  }
}

const filterMappings = {
  brandId: (value) => {
    return {
      filter: { brand: Array.isArray(value) ? { [Op.or]: value } : value },
      model: styleModel
    }
  },
  categoryId: (value) => {
    return {
      filter: { id: Array.isArray(value) ? { [Op.or]: value } : value },
      model: categoriesModel
    }
  },
  sku: (value) => {
    return {
      filter: { sku: value },
      model: releasesModel
    }
  },
  collectionId: (value) => {
    return {
      filter: { collectionId: value },
      model: releasesModel
    }
  },
  styleId: (value) => {
    return {
      filter: { styleId: value },
      model: releasesModel
    }
  },
  gender: (value) => {
    return {
      filter: { gender: value },
      model: releasesModel
    }
  },
  hot: (value) => {
    return {
      filter: { hot: value },
      model: releasesModel
    }
  },
  active: (value) => {
    return {
      filter: { active: Boolean(value) },
      model: shopsModel
    }
  },
  minPriceEUR: (value) => {
    return {
      filter: { priceEUR: { [Op.gte]: parseFloat(value) } }
    }
  },
  maxPriceEUR: (value) => {
    return {
      filter: { priceEUR: { [Op.lte]: parseFloat(value) } }
    }
  },
  minPriceGBP: (value) => {
    return {
      filter: { priceGBP: { [Op.gte]: parseFloat(value) } }
    }
  },
  maxPriceGBP: (value) => {
    return {
      filter: { priceGBP: { [Op.lte]: parseFloat(value) } }
    }
  },
  minPriceUSD: (value) => {
    return {
      filter: { priceUSD: { [Op.gte]: parseFloat(value) } }
    }
  },
  maxPriceUSD: (value) => {
    return {
      filter: { priceUSD: { [Op.lte]: parseFloat(value) } }
    }
  },
  color: (value) => {
    const colors = Array.isArray(value) ? value : [value]
    const likes = []
    colors.forEach(color => {
      likes.push({ [Op.like]: `%${color}%` })
    })
    return {
      filter: { color: { [Op.or]: likes } },
      model: releasesModel
    }
  }
}

const OfferRepository = BaseRepository(database.models.offers, Offer, { createOptions, updateOptions, getOptionsCallback, filterMappings })

const updateLinks = async (id, links) => {
  const offer = await model.findOne({
    where: { id }
  })
  if (!offer) {
    throw new EntityNotFound()
  }
  await offersLinksModel.destroy({
    where: {
      offerId: id
    }
  })
  const newLinks = await offersLinksModel.bulkCreate(links)
  await offer.setLinks(newLinks)
  return newLinks
}

const getLinks = async (id) => {
  const offer = await model.findOne({
    where: { id }
  })
  if (!offer) {
    throw new EntityNotFound()
  }
  return offer.getLinks()
}
const updateShopLinks = async (shop, apply) => {
  const shopId = shop.id
  let links = await offersLinksModel.findAll({
    include: [
      {
        model: model,
        where: { shopId }
      }
    ]
  })
  for (const link of links) {
    const toUpdate = await apply(shop, link)
    if (toUpdate) {
      await link.update(toUpdate)
    }
  }
  return links
}

Object.assign(OfferRepository, { updateLinks, updateShopLinks, getLinks })

module.exports = OfferRepository
