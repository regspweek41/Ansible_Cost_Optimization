#!/bin/bash
filename="$1"
echo "filename=$1"
IFS=","
while read RGName ClusterName
do
echo "name of the ResourceGroup: $RGName"
echo "ClusterName: $ClusterName"
ClusterName="$(echo "${ClusterName}" | tr -d '[[:space:]]')"
RGName="$(echo "${RGName}" | tr -d '[[:space:]]')"
echo "$ClusterName"
if eval az aks stop --name "$ClusterName" --resource-group "$RGName"
then
echo "command success for $ClusterName"
else
echo "command failed for $ClusterName"
fi
done < $filename