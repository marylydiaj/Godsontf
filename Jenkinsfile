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
                sh 'sudo /home/godsmahi/git clone https://github.com/GodsonSibreyan/Godsontf.git'
            }
        }
        stage('terraform init') {
            steps {
                sh 'sudo /home/godsmahi/terraform init ./Godsontf'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'ls ./Godsontf; sudo /home/godsmahi/terraform plan ./Godsontf'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'sudo /home/godsmahi/terraform apply ./Godsontf'
            }
        }
        stage('Approval') {
            steps {
                script {
                      def userInput = input(id: 'yes')
               }
           }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
