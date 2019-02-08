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
        - run:
            name: checking docker.io/tob123/nextcloud-staging:13.0.2
            command: echo this_is_just_to_get_the_container_name_into_circlecigui
        - anchore/analyze_image:
            image_name: docker.io/tob123/nextcloud-staging:13.0.2
            timeout: '800'
        - anchore/policy_evaluation:
            image_name: docker.io/tob123/nextcloud-staging:13.0.2
            policy_failure: true
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
        - run:
            name: checking docker.io/tob123/nextcloud-staging:13.0.1
            command: echo this_is_just_to_get_the_container_name_into_circlecigui
        - anchore/analyze_image:
            image_name: docker.io/tob123/nextcloud-staging:13.0.1
            timeout: '800'
        - anchore/policy_evaluation:
            image_name: docker.io/tob123/nextcloud-staging:13.0.1
            policy_failure: true
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
        - run:
            name: checking docker.io/tob123/nextcloud-staging:13.0.0
            command: echo this_is_just_to_get_the_container_name_into_circlecigui
        - anchore/analyze_image:
            image_name: docker.io/tob123/nextcloud-staging:13.0.0
            timeout: '800'
        - anchore/policy_evaluation:
            image_name: docker.io/tob123/nextcloud-staging:13.0.0
            policy_failure: true
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
        - run:
            name: checking docker.io/tob123/nextcloud-staging:13.0.9
            command: echo this_is_just_to_get_the_container_name_into_circlecigui
        - anchore/analyze_image:
            image_name: docker.io/tob123/nextcloud-staging:13.0.9
            timeout: '800'
        - anchore/policy_evaluation:
            image_name: docker.io/tob123/nextcloud-staging:13.0.9
            policy_failure: true
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
        - run:
            name: checking docker.io/tob123/nextcloud-staging:13
            command: echo this_is_just_to_get_the_container_name_into_circlecigui
        - anchore/analyze_image:
            image_name: docker.io/tob123/nextcloud-staging:13
            timeout: '800'
        - anchore/policy_evaluation:
            image_name: docker.io/tob123/nextcloud-staging:13
            policy_failure: true
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
        - run:
            name: checking docker.io/tob123/nextcloud-staging:15.0.4
            command: echo this_is_just_to_get_the_container_name_into_circlecigui
        - anchore/analyze_image:
            image_name: docker.io/tob123/nextcloud-staging:15.0.4
            timeout: '800'
        - anchore/policy_evaluation:
            image_name: docker.io/tob123/nextcloud-staging:15.0.4
            policy_failure: true
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
        - run:
            name: checking docker.io/tob123/nextcloud-staging:15
            command: echo this_is_just_to_get_the_container_name_into_circlecigui
        - anchore/analyze_image:
            image_name: docker.io/tob123/nextcloud-staging:15
            timeout: '800'
        - anchore/policy_evaluation:
            image_name: docker.io/tob123/nextcloud-staging:15
            policy_failure: true
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
        - run:
            name: checking docker.io/tob123/nextcloud-staging:14.0.7
            command: echo this_is_just_to_get_the_container_name_into_circlecigui
        - anchore/analyze_image:
            image_name: docker.io/tob123/nextcloud-staging:14.0.7
            timeout: '800'
        - anchore/policy_evaluation:
            image_name: docker.io/tob123/nextcloud-staging:14.0.7
            policy_failure: true
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
        - run:
            name: checking docker.io/tob123/nextcloud-staging:14
            command: echo this_is_just_to_get_the_container_name_into_circlecigui
        - anchore/analyze_image:
            image_name: docker.io/tob123/nextcloud-staging:14
            timeout: '800'
        - anchore/policy_evaluation:
            image_name: docker.io/tob123/nextcloud-staging:14
            policy_failure: true
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
        - anchore/parse_reports
        - store_artifacts:
            path: anchore_reports
workflows:
    anchore_sec_scan:
        jobs:
          - scan_images_nc
