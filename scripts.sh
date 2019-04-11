#create the resource group; replace with your resource name
#you can list locations with az account list-locations
az group create -n $RG -l $LOCATION

#create the appservice
#for help: az appservice plan create -h
az appservice plan create -g $RG \
                          -n $PLAN \
                          --is-linux \
                          --sku $SKU
#create the webapp and pass in the image name
#replace the names below with whatever works for you
#for help: az webapp create -h
az webapp create -n $APPNAME \
                  -g $RG \
                  -p $PLAN \
                  -i $IMAGE

#setup logging
# az webapp log config [--application-logging {false, true}]
# [--detailed-error-messages {false, true}]
# [--docker-container-logging {filesystem, off}]
# [--failed-request-tracing {false, true}]
# [--ids]
# [--level {error, information, verbose, warning}]
# [--name]
# [--resource-group]
# [--slot]
# [--subscription]
# [--web-server-logging {filesystem, off}]
az webapp log config --application-logging true \
              --web-server-logging filesystem \
              --detailed-error-messages true \
              --docker-container-logging filesystem \
              --failed-request-tracing true \
              --level information \
              --name $APPNAME \
              --resource-group $RG