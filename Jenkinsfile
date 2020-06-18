@Library('shared-lib')_
pipeline
{
    agent {
        kubernetes {
           label "jen-agent-${UUID.randomUUID().toString()}"
           yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins: jenkins-pipeline
spec:
  containers:
  - name: jnlp
    image: jenkins/jnlp-slave
    ttyEnabled: true
  - name: sonar
    image: newtmitch/sonar-scanner
    command:
    - cat
    tty: true
  securityContext:
    runAsUser: 0
"""
        }
    }
    stages {
      stage('bazel execute') {
        steps {
          dir('android/tutorial') {
            container('bazel') {
            sh """
              export PATH=$PATH:$HOME/bin
              python -V
              bazel build //src/main:app
            """
            }
          }
        }
      }
      stage('sonarqube') {
        steps {
          container('sonar') {
            sh """
              sonar-scanner -Dsonar.host.url=http://iron-hamster-sonarqube:9000
            """
          }
        }
      }
    }
    post {
    always {
      sendNotifi(currentBuild.result, buildFailChannel='#kodekloud')
    }
  }
}
