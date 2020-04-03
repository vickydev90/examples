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
  - name: bazel
    image: bazel:1.1
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
          container('bazel') {
            sh """
              hostname
            """
          }
        }
      }
    }
 }
