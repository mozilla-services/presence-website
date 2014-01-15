presence-website
================

Mozilla Presence Website displayed at http://presence.services.mozilla.com

To update the server and the two Firefox OS apps, do the following::

	ssh -i your.amazon.key.pem ubuntu@presence.services.mozilla.com
	cd presence-root
	make build

To update the presence server app::

	ssh -i your.amazon.key.pem ubuntu@presence.services.mozilla.com
	cd presence
	git pull
	bin/circusctl restart presence
	cd ../presence-tribe-server
	bin/circusctl restart tribe


To update the presence tribe app::

	ssh -i your.amazon.key.pem ubuntu@presence.services.mozilla.com
	cd presence-tribe-server
	git pull
	bin/circusctl restart tribe


