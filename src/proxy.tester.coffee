# Export Plugin Tester
module.exports = (testers) ->
	# PRepare
	pathUtil = require('path')
	{expect} = require('chai')
	superAgent = require('superagent')

	# Define My Tester
	class MyTester extends testers.ServerTester
		docpadConfig:
			port: 9779

		# Custom test for the server
		testServer: (next) ->
			# Prepare
			tester = @

			# Create the server
			super

			# Test
			@suite 'proxy', (suite,test) ->
				# Prepare
				testerConfig = tester.getConfig()
				docpad = tester.docpad
				docpadConfig = docpad.getConfig()
				plugin = tester.getPlugin()
				pluginConfig = plugin.getConfig()
				files = []

				# Prepare
				localhost = "http://localhost:#{docpadConfig.port}"

				# Request
				request = (method, relativeUrl, next) ->
					absoluteUrl = localhost+'/'+relativeUrl
					console.log "#{method} to #{absoluteUrl}"
					superAgent[method](absoluteUrl)
						.timeout(30*1000)
						.end(next)

				# Test
				test 'googlecdn', (complete) ->
					request 'get', 'googlecdn/jquery/1.10.2/jquery.min.js', (err,res) ->
						return complete(err)  if err
						expect(res.text.indexOf('jQuery v1.10.2')).to.not.eql(-1)
						return complete()
