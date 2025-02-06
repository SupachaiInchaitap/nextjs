pipeline {
    agent any
    stages {      
        stage("Copy file to Docker server"){
            steps {
				//แก้ตรง 66024963-nextjs ให้เป็นชื่อเดียวกับ pipeline job/item ที่สร้างใน jenkins
                sh "scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -r  /var/lib/jenkins/workspace/66026190-nextjs/* root@43.208.253.87:~/66026190-nextjs"
            }
        }
        
        stage("Build Docker Image") {
            steps {
                //path yaml files
				ansiblePlaybook playbook: '/var/lib/jenkins/workspace/66026190-nextjs/playbooks/build.yaml'
            }    
        } 
        
        stage("Create Docker Container") {
            steps {
                //path yaml files
				ansiblePlaybook playbook: '/var/lib/jenkins/workspace/66026190-nextjs/playbooks/deploy.yaml'
            }    
        } 
    }
}
