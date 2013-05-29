var mocha = require('mocha')

mocha.setup('bdd')

require('./{{project_name}}.test.js')

mocha.run(function () {
	console.log('Done!')
})
