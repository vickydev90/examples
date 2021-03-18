#!groovy
@Library('shared-lib')_

def containers = [
    containerTemplate(name: 'jnlp', image: 'jenkins/jnlp-slave', ttyEnabled: true)
  ]

def label = "jen-agent-${UUID.randomUUID().toString()}"

def config = "staging.properties"

podTemplate(label: label, containers: containers) {
    node(label) {
        stage('🔦 code checkout') {
            checkout scm
        }
        stage('setting env') {
            loadEnv(config)
        }
        stage('Install') {
            sh "echo ${BAZEL_TOOLS}"
            sh "echo ${ANDROID_HOME}"
        }
    }
 }
