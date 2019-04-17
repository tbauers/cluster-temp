#!/bin/bash

# kubectl apply --dry-run -o json -k ./overlays/${NAMESPACE} > ./output/result.json
kustomize build ./overlays/${NAMESPACE} > ./output/result.yaml
sed -i "s@api-base@${SERVICE_NAME}@g" output/result.yaml
sed -i "s@namespace-id@${NAMESPACE}@g" output/result.yaml
# sed -i "s@-${NAMESPACE}@@g" output/result.yaml
sed -i "s@version@${VERSION}@g" output/result.yaml
