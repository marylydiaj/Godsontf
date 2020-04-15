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
                sh label: '', script: ''' sed -i \'s/user/AKIAJHLKWV6A2Z4JY2JA/g\' /var/lib/jenkins/workspace/terragods/variables.tf
sed -i \'s/password/PzFXmvnMbjSB9l+UWtIZtL1wIbZrFWPzRqP1HGVT/g\' /var/lib/jenkins/workspace/terragods/variables.tf
sed -i \"s/t2.micro/$instance_type/g\" /var/lib/jenkins/workspace/terragods/variables.tf
sed -i \"s/10/$instance_size/g\" /var/lib/jenkins/workspace/terragods/ec2.tf'''
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
                sh 'terraform apply  -auto-approve'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
