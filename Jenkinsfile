@Library('shared-lib')_

properties = null     

def loadProperties() {
    node {
        checkout scm
        properties = new Properties()
        File propertiesFile = new File("${workspace}/staging.properties")
        properties.load(propertiesFile.newDataInputStream())
        echo "${properties.BAZEL_TOOLS}"
    }
}

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
  stage('Env variables') {
      loadProperties()
      echo "${properties.BAZEL_TOOLS}"
    //loadEnv(envFile: "${env.WORKSPACE}/staging.properties")
    //loadEnv()
    }
  }
}