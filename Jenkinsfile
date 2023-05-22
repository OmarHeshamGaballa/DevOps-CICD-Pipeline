node{
    
    stage('Git Checkout'){
        
        git 'https://github.com/OmarHeshamGaballa/DevOps-CICD-Pipeline.git'
    }
    
    stage('Sending files to Ansible via SSH'){
        sshagent(['ansibledemo']) {
           sh 'ssh -o StrictHostKeyChecking=no ubuntu@15.237.141.35'
            sh 'scp /var/lib/jenkins/workspace/demo-pipeline/* ubuntu@15.237.141.35:/home/ubuntu '
    }
    }
    stage('Docker Image Building stage'){
        sshagent(['ansibledemo']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@15.237.141.35  cd /home/ubuntu '
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@15.237.141.35  docker image build -t  $JOB_NAME:v1.$BUILD_ID . '
        }   
    }
    stage('Docker Image Tagging '){
        sshagent(['ansibledemo']) {
             sh 'ssh -o StrictHostKeyChecking=no ubuntu@15.237.141.35  cd /home/ubuntu'
             sh 'ssh -o StrictHostKeyChecking=no ubuntu@15.237.141.35  docker image tag $JOB_NAME:v1.$BUILD_ID  omargaballa/$JOB_NAME:v1.$BUILD_ID'
             sh 'ssh -o StrictHostKeyChecking=no ubuntu@15.237.141.35  docker image tag $JOB_NAME:v1.$BUILD_ID omargaballa/$JOB_NAME:latest'
        }
    }
    stage('Push Docker Image to Dockerhub'){
        sshagent(['ansibledemo']) {
            withCredentials([string(credentialsId: 'dockerhub_passwd', variable: 'dockerhub_passwd')]) {
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@15.237.141.35  docker login -u omargaballa -p ${dockerhub_passwd}"
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@15.237.141.35  docker image push omargaballa/$JOB_NAME:v1.$BUILD_ID '
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@15.237.141.35  docker image push omargaballa/$JOB_NAME:latest '
             }
        }    
    }
    stage('Copy files from Jenkins to K8S'){
        sshagent(['k8s_server']) {
             sh 'ssh -o StrictHostKeyChecking=no ubuntu@13.38.22.143 '
             sh 'scp /var/lib/jenkins/workspace/demo-pipeline/* ubuntu@13.38.22.143:/home/ubuntu '
        }
    }
    
    stage('Running Ansible-Playbook'){
        sshagent(['ansibledemo']) {
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@15.237.141.35 cd /home/ubuntu'
            sh 'ssh -o StrictHostKeyChecking=no ubuntu@15.237.141.35 ansible-playbook ansible.yml ' 
        }
        
    }
}
