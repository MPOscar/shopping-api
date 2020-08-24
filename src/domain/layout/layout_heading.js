const t = require('tcomb')

const Layout = t.struct({
  title: t.maybe(t.String),
  description: t.maybe(t.String),
  keywords: t.maybe(t.String),
  imgUrl: t.maybe(t.String),
  displayOnPage: t.maybe(t.Boolean)
}, {
  defaultProps: {
    description: '',
    keywords: '',
    displayOnPage: true
  }
})

module.exports = Layout
