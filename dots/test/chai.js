
var chai = require('chai')

global.should = chai.should()
global.expect = chai.expect

chai.Assertion.includeStack = true

module.exports = chai