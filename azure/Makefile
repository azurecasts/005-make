APPNAME=velzyapp
RG=velzy
PLAN=velzyplan
LOCATION=westus2
SKU=S1
IMAGE=robconery/velzy

all: logs

rg:
	az group create -n $(RG) -l $(LOCATION)

plan: rg
	az appservice plan create -g $(RG) \
														-n $(PLAN) \
														--is-linux \
														--sku $(SKU)
webapp: plan
	az webapp create -n $(APPNAME) \
										-g $(RG) \
										-p $(PLAN) \
										-i $(IMAGE)
logging: webapp
	az webapp log config --application-logging true \
								--web-server-logging filesystem \
								--detailed-error-messages true \
								--docker-container-logging filesystem \
								--failed-request-tracing true \
								--level information \
								--name $(APPNAME) \
								--resource-group $(RG)

open: logging
	open https://$(APPNAME).azurewebsites.net

logs: open
	az webapp log tail -n $(APPNAME) -g $(RG)

rollback:
	az group delete -n $(RG) -y

.PHONY: logs rollback open webapp rg plan all