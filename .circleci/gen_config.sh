NC_TAGS=$(curl -L -s 'https://registry.hub.docker.com/v2/repositories/tob123/nextcloud/tags' | jq -r '."results"[]["name"]')
for i in ${NC_TAGS}
do #echo $i
NC_INPUT=$(mktemp)
cat <<EOF > $NC_INPUT
        - run:
            name: checking docker.io/tob123/nextcloud:${i}
            command: echo this_is_just_to_get_the_container_name_into_circlecigui
        - anchore/analyze_image:
            image_name: docker.io/tob123/nextcloud:${i}
            timeout: '800'
        - anchore/policy_evaluation:
            image_name: docker.io/tob123/nextcloud:${i}
            policy_failure: true
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
EOF
#cat $NC_INPUT

sed -i "/setup_anchore_engine/r ${NC_INPUT}" config.yml
rm $NC_INPUT
done
