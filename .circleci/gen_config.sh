NC_TAGS=$(curl -L -s 'https://registry.hub.docker.com/v2/repositories/tob123/nextcloud/tags' | jq -r '."results"[]["name"]')
for i in ${NC_TAGS}
do #echo $i
NC_INPUT=$(mktemp)
cat <<EOF > $NC_INPUT
          - anchore/image_scan:
              image_name: docker.io/tob123/nextcloud:${i}
              policy_failure: true
EOF
#cat $NC_INPUT

sed -i "/jobs:/r ${NC_INPUT}" config.yml
rm $NC_INPUT
done
