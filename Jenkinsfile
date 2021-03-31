#!groovy
@Library('shared-lib')_
import org.lab.*

properties([
  parameters([
    stringParam(name: 'folderName', defaultValue: '', description: 'environment folder name')
   ])
])


def containers = [
    containerTemplate(name: 'jnlp', image: 'jenkins/jnlp-slave', ttyEnabled: true)
  ]

def label = "jen-agent-${UUID.randomUUID().toString()}"

def config = "staging.properties"
String folderName = params.folderName

podTemplate(label: label, containers: containers) {
    node(label) {
        stage('🔦 code checkout') {
            checkout scm
        }
        stage('setting env') {
            //loadEnv(config, folderName)
            def changeSet = currentBuild.changeSets
            for (int i = 0; i < changeSet.size(); i++) 
            {
              def entries = changeSet[i].items;
              println "${entries}"
            }
        }
        stage('Install') {
            sh "echo ${BAZEL_TOOLS}"
            sh "echo ${ANDROID_HOME}"
        }
    }
 }
