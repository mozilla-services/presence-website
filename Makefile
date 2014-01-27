clean:
	rm -f presence.zip

build: clean
	git pull
	cd presence-fxapp; git checkout master; git pull
	cd presence-fxapp/src; zip -r ../presence.zip *
