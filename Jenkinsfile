pipeline
{
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
#  - name: sonar
#    image: newtmitch/sonar-scanner
#    command:
#    - cat
#    tty: true
  - name: bazel
    image: l.gcr.io/google/bazel:0.29.1
    command:
    - cat
    tty: true
  securityContext:
    runAsUser: 0
"""
        }
    }
    stages {
      stage('build') {
        steps {
          /*dir ('java-maven/bazel-out/_coverage') {
            writeFile file:'_coverage_report.dat', text:''
          }*/
          
          dir('java-maven') {
            container('bazel') {
              sh """
                bazel test //:tests --collect_code_coverage --combined_report=lcov \
                --coverage_report_generator=@bazel_sonarqube//:sonarqube_coverage_generator
  
                bazel run //:sq -- -Dsonar.host.url=http://35.205.100.49:30686 -Dsonar.login=0e574110afe2fb2c5ac6a70d447752a648055a44 \
                -Dsonar.exclusions=**/src/main/java/com/example/*.java
                #bazel build //:java-maven
              """
             }
           }
        }
      }
      /*stage('sonarrr') {
        steps {
          dir('java-maven') {
            container('bazel') {
            sh """
              bazel test :tests --collect_code_coverage --combined_report=lcov \
              --coverage_report_generator=@bazel_sonarqube//:sonarqube_coverage_generator
            """
            }
          }
        }
      }*/
     /* stage('sonarqube') {
        steps {
          container('sonar') {
            sh """
              sonar-scanner -Dsonar.host.url=http://iron-hamster-sonarqube:9000
            """
          }
        }
      }*/
    }
 }
