pipeline{
    agent {

    docker {
      image 'jenkinstest:1'
    }

  }
    stages{
        stage ("git clone"){
            steps {
                git 'https://github.com/artur50000/box3.git'
            }
        }
        
        stage ("build"){
            steps {
               sh 'mvn package'
               sh'sudo service docker start'
          }
        }
        
        stage ("deploy"){
            steps {
               sh 'CID=$(sudo docker create jenkinstest:1)'
               sh 'sudo docker cp ${CID}:/home/ubuntu/Dockerfile /var/lib/jenkins/workspace/dockertest2/Dockerfile'
               sh 'sudo docker rm ${CID}'
               sh 'sudo docker build -t tomcattest:1 . ' 
          }
        }
        
        
       
       
        
    }
    
        
    
}
