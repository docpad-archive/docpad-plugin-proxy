# Proxy Plugin for [DocPad](http://docpad.org)

[![NPM version](https://badge.fury.io/js/docpad-plugin-proxy.png)](https://npmjs.org/package/docpad-plugin-proxy "View this project on NPM")
[![Gittip donate button](http://badgr.co/gittip/docpad.png)](https://www.gittip.com/docpad/ "Donate weekly to this project using Gittip")
[![Flattr donate button](https://raw.github.com/balupton/flattr-buttons/master/badge-89x18.gif)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://www.paypalobjects.com/en_AU/i/btn/btn_donate_SM.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")

Proxy specific routes of our DocPad server to different locations


## Usage
Add the your proxies to the [docpad configuration file](http://docpad.org/docs/config) like so:

``` coffee
	plugins:
		proxy:
			proxies: 
				'/some/path': 'http://some-proxy.com'
				'/another/path': 'http://another-proxy.com'
```


## History
[You can discover the history inside the `History.md` file](https://github.com/bevry/docpad-plugin-proxy/blob/master/History.md#files)


## Contributing
[You can discover the contributing instructions inside the `Contributing.md` file](https://github.com/bevry/docpad-plugin-proxy/blob/master/Contributing.md#files)


## License
Licensed under the incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://creativecommons.org/licenses/MIT/)
<br/>Copyright &copy; 2012+ [Bevry Pty Ltd](http://bevry.me) <us@bevry.me>