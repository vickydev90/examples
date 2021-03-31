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
            def changeLogSets = currentBuild.changeSets
            for (int i = 0; i < changeLogSets.size(); i++) {
                def entries = changeLogSets[i].items
                for (int j = 0; j < entries.length; j++) {
                    def entry = entries[j]
                    echo "${entry.commitId} by ${entry.author} on ${new Date(entry.timestamp)}: ${entry.msg}"
                    def files = new ArrayList(entry.affectedFiles)
                    for (int k = 0; k < files.size(); k++) {
                        def file = files[k]
                        echo "  ${file.editType.name} ${file.path}"
                    }
                }  
            } 
        }
        stage('Install') {
            sh "echo ${BAZEL_TOOLS}"
            sh "echo ${ANDROID_HOME}"
        }
    }
 }
