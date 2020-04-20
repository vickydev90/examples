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
  - name: bazel
    image: insready/bazel
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
          dir('java-tutorial') {
            container('bazel') {
            sh """
              bazel run //:sq -- -Dsonar.host.url=http://35.195.95.9:32040 -Dsonar.login=2b6cd76b654a897ba7d580e60b8f4d2cccd7624a \
              Dsonar.java.binaries=**/target/classes
            """
            }
          }
        }
      }
     /* stage('sonarqube') {
        steps {
          container('sonar') {
            sh """
              sonar-scanner -Dsonar.host.url=http://iron-hamster-sonarqube:9000
            """
          }
        }
      }*/
    }
 }
