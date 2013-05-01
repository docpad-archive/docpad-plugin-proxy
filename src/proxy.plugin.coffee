# Export Plugin
module.exports = (BasePlugin) ->
	# Import
	request = require('request')
	urlUtil = require('url')
	querystring = require('querystring')
	_ = require('lodash')

	# Plugin
	class ProxyPlugin extends BasePlugin

		name: 'proxy'

		serverAfter: (opts) ->
			{server} = opts
			proxy = @
			proxy.config.proxies or= {}

			for key, value of proxy.config.proxies
				server.all value.path, (req, res) ->

					proxyUrl = urlUtil.parse(value.domain)
					proxyUrl.path = proxyUrl.pathname = req.url
					newUrl = urlUtil.format(proxyUrl)

					options =
						url: newUrl
						method: req.method
						headers: req.headers

					options.headers.host = proxyUrl.host

					unless _.isEmpty(req.body)
					    if req.headers['content-type'] and (req.headers['content-type'].split ";")[0] is 'application/json'
                            options.body = JSON.stringify req.body
                        else 
                            options.body = querystring.stringify req.body

					request(options).pipe(res)


