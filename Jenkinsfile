@Library('shared-lib')_

properties = null     

def loadProperties() {
    //node {
     //   checkout scm
        //properties = new Properties()
        //File propertiesFile = new File("${workspace}/staging.properties")
        //properties.load(propertiesFile.newDataInputStream())
        properties = readProperties file: 'staging.properties'
        Set<Object> keys = properties.keySet();
        for(Object k:keys){
        String key = (String)k;
        String value = (String) getProperties(key)
        env."${key}" = "${value}"
        echo "Immediate one ${BAZEL_TOOLS}"
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
                    echo "Later one ${BAZEL_TOOLS}"
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