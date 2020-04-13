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
        stage('git clone') {
            steps {
                sh 'sudo git clone https://github.com/GodsonSibreyan/Godsontf.git'
            }
        }
        stage('terraform init') {
            steps {
                sh 'sudo terraform init ./Godsontf'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'ls ./Godsontf; sudo terraform plan ./Godsontf'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'sudo terraform apply -auto-approval./Godsontf'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
