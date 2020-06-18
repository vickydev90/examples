pipeline
{
<<<<<<< HEAD
=======
    parameters {
          choice(
            name: 'Environment',
            choices: "Testing\nStaging",
            description: 'Environment name to deploy' )
    }
>>>>>>> ba29d5eed9b8ff3d5c165dd4fc87e93ddb51239d
    agent {
        kubernetes {
           label "jen-agent-${UUID.randomUUID().toString()}"
           yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins: jenkins-pipeline
spec:
  containers:
  - name: jnlp
    image: jenkins/jnlp-slave
    ttyEnabled: true
<<<<<<< HEAD
=======
  - name: jenk-bazel
    image: vickyd/jenk_bazel:v1.1
  imagePullSecrets:
  - name: regcred
    command:
    - cat
    tty: true 
>>>>>>> ba29d5eed9b8ff3d5c165dd4fc87e93ddb51239d
  - name: sonar
    image: newtmitch/sonar-scanner
    command:
    - cat
    tty: true
  - name: bazel
<<<<<<< HEAD
    image: bazel:1.2
=======
    image: l.gcr.io/google/bazel:0.29.1
>>>>>>> ba29d5eed9b8ff3d5c165dd4fc87e93ddb51239d
    command:
    - cat
    tty: true
  securityContext:
    runAsUser: 0
"""
        }
    }
    stages {
<<<<<<< HEAD
      /*stage('bazel execute') {
        steps {
          dir('android/tutorial') {
            container('bazel') {
            sh """
              export PATH=$PATH:$HOME/bin
              python -V
              bazel build //src/main:app
            """
=======
      /*stage('build') {
        steps {
          dir ('java-maven/bazel-out/_coverage') {
            writeFile file:'_coverage_report.dat', text:''
              sh 'chmod 755 _coverage_report.dat'
          }
          
          dir('java-maven') {
            container('bazel') {
              sh """
                bazel test //:tests --collect_code_coverage --combined_report=lcov \
                --coverage_report_generator=@bazel_sonarqube//:sonarqube_coverage_generator
                #bazel build //:java-maven
              """
             }
           }
        }
      }
      stage('sonarrr') {
        steps {
          dir('java-maven') {
            withSonarQubeEnv('sonarqube') {
              container('bazel') {
                sh """
                  bazel run //:sq -- -Dsonar.java.source=11
                """
              }
>>>>>>> ba29d5eed9b8ff3d5c165dd4fc87e93ddb51239d
            }
          }
        }
      }*/
      stage('sonarqube') {
        steps {
<<<<<<< HEAD
          container('sonar') {
            sh """
              sonar-scanner -Dsonar.host.url=http://iron-hamster-sonarqube:9000
            """
=======
          dir('java-maven') {  
            withSonarQubeEnv('sonarqube') {
              container('sonar') {
                sh """
                  sonar-scanner
                """
              }
            }
>>>>>>> ba29d5eed9b8ff3d5c165dd4fc87e93ddb51239d
          }
        }
      }
    }
 }
