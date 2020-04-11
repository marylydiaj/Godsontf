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
                sh 'sudo rm -r *;sudo git clone https://github.com/GodsonSibreyan/Godsontf.git'
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
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
