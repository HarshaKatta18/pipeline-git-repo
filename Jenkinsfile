pipeline {
  agent any

  tools {
    jdk 'jdk11'
  }

  stages {

    stage('Checkout') {
      steps {
        echo 'Code already checked out by Jenkins'
      }
    }

    stage('Build') {
      steps {
        echo 'Building application...'
        sh 'bash build.sh'
      }
    }

    stage('Test') {
  steps {
    echo 'Running tests...'
    sh 'java -cp bin com.example.HelloDevOpsTest'
  }
}


    stage('Archive') {
      steps {
        echo 'Archiving artifacts...'
        archiveArtifacts artifacts: 'app.jar', fingerprint: true
        archiveArtifacts artifacts: 'build.sh', fingerprint: true
      }
    }
  }

  post {
    always {
      echo 'Pipeline completed'
      cleanWs()
    }
  }
}
