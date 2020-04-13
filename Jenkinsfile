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
                sh '/home/godsmahi/rm -r *; /home/godsmahi/git clone https://github.com/GodsonSibreyan/Godsontf.git'
            }
        }
        stage('Parameter') {
            steps {
                script {
                    sed 's/default     = "t2.micro"/default     = "echo"$instance_type""/g' /home/godsmahi/Godsontf/variables.tf
                }
            }
        }
        stage('terraform init') {
            steps {
                sh '/home/godsmahi/terraform init ./Godsontf'
            }
        }
        stage('terraform plan') {
            steps {
                sh 'ls ./Godsontf;/home/godsmahi/terraform plan ./Godsontf'
            }
        }
        stage('terraform apply') {
            steps {
                sh '/home/godsmahi/terraform apply -auto-approval./Godsontf'
            }
        }
        stage('terraform ended') {
            steps {
                sh 'echo "Ended....!!"'
            }
        }

        
    }
}
