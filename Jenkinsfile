pipeline{
    agent {
        
    docker {
      image 'jenkinstest:1'
      args '-u root --privileged -v /var/run/docker.sock:/var/run/docker.sock' 
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
               sh 'service docker start'
               sh 'service docker status'
               sh 'docker ps'
               
          }
        }
        
        stage ("deploy"){
            steps {
               sh 'docker run --rm jenkinstest:1 cat /home/ubuntu/Dockerfile > Dockerfile'
               sh 'docker build -t artur50000/tomcat:1 . '
               sh 'docker login -u="artur50000" -p="$PASS"' 
               sh 'docker push artur50000/tomcat:1'
                
          }
        }
        
     }
    
  
}
