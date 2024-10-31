#!/bin/bash

# Jenkins 홈 디렉토리에 적절한 권한 부여
chown -R jenkins:jenkins $JENKINS_HOME

# Jenkins 실행
exec /usr/bin/tini -- /usr/local/bin/jenkins.sh "$@"