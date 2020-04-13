pipeline {
    agent {
        node {
            label 'master'
        }
    }

    stages {
        stage('terraform started') {
            steps {
                sh 'echo "Started...!" '
            }
        }
        stage('terraform clone') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '7e261af1-1211-4b5a-9478-675cac127cce', url: 'https://github.com/GodsonSibreyan/Godsontf.git']]])
            }
        }
        stage('key'){
            steps {
                sh '''
                  sed -e 's/$access_key/access/g' /var/lib/jenkins/workspace/terragods/variables.tf
                  sed -e 's/$secret_key/secret/g' /var/lib/jenkins/workspace/terragods/variables.tf
                  '''
                  }
            }
            
        stage('terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'terraform apply -auto-approval'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
