pipeline {
    agent any

    stages {      
        stage("Install Dependencies & Build Next.js") {
            steps {
                sh """
                cd /var/lib/jenkins/workspace/66026190-nextjs
                npm install
                npm run build
                """
            }
        }

        stage("Copy Files to Docker Server") {
            steps {
                sh "scp -r /var/lib/jenkins/workspace/66026190-nextjs/* root@43.208.253.87:~/66026190-nextjs"
            }
        }
        
        stage("Build Docker Image") {
            steps {
                ansiblePlaybook playbook: '/var/lib/jenkins/workspace/66026190-nextjs/playbooks/build.yaml'
            }    
        } 
        
        stage("Deploy Docker Container") {
            steps {
                ansiblePlaybook playbook: '/var/lib/jenkins/workspace/66026190-nextjs/playbooks/deploy.yaml'
            }    
        } 
    }
}
