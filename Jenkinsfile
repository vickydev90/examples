@Library('shared-lib')_

def loadEnvironmentVariables(path){
    def props = readProperties  file: path
    keys= props.keySet()
    for(key in keys) {
        value = props["${key}"]
        env."${key}" = "${value}"
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
    loadEnvironmentVariables("${env.WORKSPACE}/staging.properties")
    //loadEnv()
    echo "${BAZEL_TOOLS}"
    }
  }
}