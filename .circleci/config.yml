version: 2.1

orbs:
    anchore: anchore/anchore-engine@1.2.0

jobs:
  scan_images_nc:
    executor: anchore/anchore_engine
    steps:
        - checkout
        - anchore/install_tools
        - anchore/setup_anchore_engine
        - run:
            name: checking docker.io/tob123/nextcloud-staging:13.0.4
            command: echo this_is_just_to_get_the_container_name_into_circlecigui
        - anchore/analyze_image:
            image_name: docker.io/tob123/nextcloud-staging:13.0.4
            timeout: '800'
        - anchore/policy_evaluation:
            image_name: docker.io/tob123/nextcloud-staging:13.0.4
            policy_failure: true
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
workflows:
    anchore_sec_scan:
        jobs:
          - scan_images_nc
