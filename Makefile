clean:
	rm -f presence.zip
	rm -f tribe.zip

build: clean
	git pull
	cd presence-fxapp; git checkout master; git pull
	cd presence-fxapp/src; zip -r ../presence.zip *
	cd presence-tribe; git checkout master; git pull
	cd presence-tribe/src; zip -r ../tribe.zip *
