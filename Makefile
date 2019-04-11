APPNAME=velzyapp
RG=velzy
IMG=robconery/velzy

build:
	docker build -t $(IMG) .

run:
	docker run --rm -p 3000:3000 $(IMG)

web:
	DEBUG=005:* npm start

logs:
	az webapp log tail -n $(APPNAME) -g $(RG) --verbose