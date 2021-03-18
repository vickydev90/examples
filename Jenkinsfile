#!groovy
@Library('shared-lib')_
import org.lab.*

parameters {
  string defaultValue: '', description: 'environment folder name', name: 'folderName', trim: false
}


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
            loadEnv(config, folderName)
        }
        stage('Install') {
            sh "echo ${BAZEL_TOOLS}"
            sh "echo ${ANDROID_HOME}"
        }
    }
 }
