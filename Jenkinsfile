pipeline
{
    agent any
    parameters
    {
        choice (name: 'meghanath', choices: "dev\nqa", description: 'deploy')
    }
    stages
    {
        stage('git checkout')
        {
            steps
            {
                git credentialsId: 'git-crd', url: 'https://github.com/Meghanath315/dtom.git'
            }
            
        }
        stage('docker image build and push')
        {
            steps
            {
                
                withDockerRegistry(credentialsId: 'docker-crd', url: 'https://index.docker.io/v1/')
                {
                    sh 'docker build -t meghanath/tomim1:1 -f Dockerfile .'
                    sh 'docker build -t meghanath/tomim2:1 -f Dockerfile1 .'
                    sh 'docker push meghanath/tomim1:1'
                    sh 'docker push meghanath/tomim2:1'
                    sh 'docker rmi -f meghanath/tomim1:1'
                    sh 'docker rmi -f meghanath/tomim2:1'
                    
                }
            }
            
        }
        stage('playbook for dev')
        {
            steps
            {
                script
                {
                    if("${params.meghanath}" == "dev")
                {
                ansiblePlaybook credentialsId: 'ans-crd', installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: '/var/lib/jenkins/workspace/dtomtest/ansible.yml', skippedTags: 'qa'
                }
                    
                }
                
            }
        }
        stage('playbook for qa')
        {
            steps
            {
                script
                {
                    if("${params.meghanath}" == "qa")
                {
                ansiblePlaybook credentialsId: 'ans-crd', installation: 'ansible', inventory: '/etc/ansible/hosts', playbook: '/var/lib/jenkins/workspace/dtomtest/ansible.yml', skippedTags: 'dev'
                }
                    
                }
                
            }
            
        }
        
    }
}

