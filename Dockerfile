FROM jenkins/jenkins:lts

USER root

# Jenkins 환경 변수 설정
ENV JENKINS_HOME /var/jenkins_home
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV JENKINS_PORT=8000

#RUN sed -i 's/8080/8000/g' /usr/share/jenkins/ref/jenkins.model.JenkinsLocationConfiguration.xml

# entrypoint 스크립트 복사
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# 다시 Jenkins 사용자로 전환
USER jenkins
# 엔트리포인트 설정
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# 포트 노출
EXPOSE 8000 8080 50000