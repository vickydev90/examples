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
properties = null     

def loadProperties() {
    node(POD_LABEL) {
        checkout scm
        properties = new Properties()
        File propertiesFile = new File("${workspace}/staging.properties")
        properties.load(propertiesFile.newDataInputStream())
        echo "${BAZEL_TOOLS}"
    }
  }
}
//node(POD_LABEL) {
//    checkout scm
//    stage('Env variables') {
      //loadEnv(envFile: "${env.WORKSPACE}/staging.properties")
//      loadEnv()
//      sh "echo ${BAZEL_TOOLS}"