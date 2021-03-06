pipeline {
  agent any
  tools{
    maven 'maven385'
    jdk 'jdk11'
  }
  parameters {
    string(name: 'image_name', defaultValue: 'demo')
    string(name: 'image_version', defaultValue: 'v1')
    string(name: 'host_port', defaultValue: '9101')
  }
  triggers {
    pollSCM('* * * * *')
  }
  stages{
    stage ('maven build jar'){
      steps {
        bat 'mvn clean package'
      }
    }
    stage ('remove current container') {
      steps {
        bat "call ${env.WORKSPACE}/removeCurrentContainer.bat ${params.image_name} ${params.image_version}"
      }
    }
    stage ('remove current image') {
      steps {
        bat "call ${env.WORKSPACE}/removeCurrentImage.bat ${params.image_name} ${params.image_version}"
      }
    }
    stage ('clean dangling images') {
      steps {
        bat "call ${env.WORKSPACE}/cleanDanglingImages.bat"
      }
    }
    stage ('build docker image') {
      steps {
        bat "docker build . -t ${params.image_name}:${params.image_version}"
      }
    }
    stage ('start container') {
      steps {
        bat "call ${env.WORKSPACE}/startContainer.bat ${params.host_port} ${params.image_name} ${params.image_version}"
      }
    }
  }
}