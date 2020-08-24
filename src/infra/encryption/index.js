const bcrypt = require('bcrypt-nodejs')

const encryptPassword = (password) => {
  const salt = bcrypt.genSaltSync()
  return bcrypt.hashSync(password, salt)
}

const comparePassword = (password, encodedPassword) => {
  return bcrypt.compareSync(password, encodedPassword)
}

module.exports = {
  encryptPassword,
  comparePassword
}
