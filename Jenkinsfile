@Library('shared-lib')_

properties = null     

def loadProperties() {
    node {
        checkout scm
        properties = new Properties()
        File propertiesFile = new File("${workspace}/staging.properties")
        properties.load(propertiesFile.newDataInputStream())
        echo "Immediate one ${properties.BAZEL_TOOLS}"
    }
}

pipeline {
    agent none

    stages {
        stage ('prepare') {
            agent any

            steps {
                script {
                    loadProperties()
                    echo "Later one ${properties.BAZEL_TOOLS}"
                }
            }
        }
        stage('Build') {
            agent { label 'master'  }

            steps {
                // works fine. properties is available everywhere
                echo properties.BAZEL_TOOLS
            }           
        }
    }
}