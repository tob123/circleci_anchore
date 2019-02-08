NC_TAGS=$(curl -L -s 'https://registry.hub.docker.com/v2/repositories/tob123/nextcloud-staging/tags' | jq -r '."results"[]["name"]')
DIR_NAME=$(dirname $0)
rm ${DIR_NAME}/config.yml
cat <<EOF > ${DIR_NAME}/config.yml
version: 2.1

orbs:
    anchore: anchore/anchore-engine@1.1.0

jobs:
  scan_images_nc:
    executor: anchore/anchore_engine
    steps:
        - checkout
        - anchore/install_tools
        - anchore/setup_anchore_engine
EOF
for i in ${NC_TAGS}
do #echo $i
NC_INPUT=$(mktemp)
cat <<EOF > $NC_INPUT
        - run:
            name: checking docker.io/tob123/nextcloud-staging:${i}
            command: echo this_is_just_to_get_the_container_name_into_circlecigui
        - anchore/analyze_image:
            image_name: docker.io/tob123/nextcloud-staging:${i}
            timeout: '800'
        - anchore/policy_evaluation:
            image_name: docker.io/tob123/nextcloud-staging:${i}
            policy_failure: true
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
EOF
#cat $NC_INPUT

sed -i "/setup_anchore_engine/r ${NC_INPUT}" ${DIR_NAME}/config.yml
rm $NC_INPUT
done
cat <<EOF >> ${DIR_NAME}/config.yml
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
workflows:
    anchore_sec_scan:
        jobs:
          - scan_images_nc
EOF
