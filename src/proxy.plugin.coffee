# Export Plugin
module.exports = (BasePlugin) ->
	# Import
	proxyMiddleware = require('proxy-middleware')
	urlUtil = require('url')

	# Define Plugin
	class ProxyPlugin extends BasePlugin
		# Plugin name
		name: 'proxy'

		# Add our proxies
		serverExtend: (opts) ->
			# Prepare
			docpad = @docpad
			proxies = @getConfig().proxies or {}

			# Add the proxies
			for own key, value of proxies
				docpad.log 'info', "Setting up proxy from #{key} to #{value}"
				opts.serverExpress.use key, proxyMiddleware(urlUtil.parse(value))

			# Complete
			return true