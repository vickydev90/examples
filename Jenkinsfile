#!groovy
@Library('shared-lib')_
import org.lab.*

//properties([
//  parameters([
//    stringParam(name: 'folderName', defaultValue: '', description: 'environment folder name')
//   ])
//])


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
            def arn = "arn:aws:iam::123456789012:role/application_abc/component_xyz/RDSAccess"
            //loadEnv(config, folderName)
            //whitelist = ["folders"]
            //blacklist = ["tutorial"]
            //foldersChanged = []
            //def changeLogSets = currentBuild.changeSets
            //for (changeLogSet in changeLogSets) {
            //    for (entry in changeLogSet.items) {
            //        //println "${entry.commitId} by ${entry.author} on ${new Date(entry.timestamp)}: ${entry.msg}"
            //        for (file in entry.affectedFiles) {
            //            if ((file.editType.name == 'add' || file.editType.name == 'edit' || file.editType.name == 'delete') && whitelist.contains(file.path.tokenize('/')[0]) && !blacklist.contains(file.path.tokenize('/')[0])) {
                            // foldersChanged += "${file.path}".tokenize('/')[0] + "/" + "${file.path}".tokenize('/')[1]
                            // foldersChanged += "${file.path}".substring(0, "${file.path}".lastIndexOf("/"))
                            // println "${foldersChanged}"
                        //echo " ${file.editType.name} ${file.path}".tokenize('/')[0]
                        // }
                    // }
                // }
            sh """
                mkdir ~/.aws
                printf "%s\n%s\n[profile sandbox]\nsource_profile = default\nrole_arn = ${arn}" >> ~/.aws/credentials 
            """
            sh "cat ~/.aws/credentials"
            }     
        }
        //stage('Install') {
        //    sh "echo ${BAZEL_TOOLS}"
        //    sh "echo ${ANDROID_HOME}"
        //}
    }
