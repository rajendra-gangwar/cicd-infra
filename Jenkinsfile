pipeline {
  agent { label 'master'}
  options {
    skipDefaultCheckout(true)
  }
  stages{
    stage('clean workspace') {
      steps {
        cleanWs()
      }
    }
    stage('checkout') {
      steps {
        git branch: 'main', url: 'https://github.com/rajendra-gangwar/cicd-infra.git'
      }
    }
    stage('terraform') {
      steps {
	    sh 'terraform init'
	    sh 'terraform workspace new prod'
        sh 'terraforme apply -auto-approve -no-color'
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}
