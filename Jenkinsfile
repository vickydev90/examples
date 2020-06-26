@Library('shared-lib')_

podTemplate(yaml: """
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
) {
node(POD_LABEL) {
    stage{
        checkout scm
    }
    stage('Env variables') {
        path = "${workspace}/staging.properties"
        loadEnv(path)
    }
  }
}