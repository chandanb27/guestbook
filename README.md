# guestbook

Task 1: Setup and Configuration

     1.Create a GitRepository 
       Created a repository in GitHub and hosted the source code of guestbook web application
       Repository URL - https://github.com/chandanb27/guestbook.git 
       
       ![Screenshot 2024-03-10 223306](https://github.com/chandanb27/guestbook/assets/135106598/51979fce-7bf9-4d7f-97dc-c0e72d1bfc48) 

     2.Install Argo CD on Your Kubernetes Cluster:
       Minikube is needed to run Argo CD in windows,installed Minikube in PowerShell
       Minikube installation documentation - https://minikube.sigs.k8s.io/docs/start/
       
       To install Argo CD, I refered official Argo CD documentation
       Documentation URL - https://argo-cd.readthedocs.io/en/stable/getting_started/ 

       commands used to install 
       kubectl create namespace argocd
       kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
       kubectl port-forward svc/argocd-server -n argocd 8080:443
       API server can then be accessed using https://localhost:8080

       To login as admin user, The initial password for the admin account is auto-generated and stored as clear text in a secret named argocd-initial-admin-secret
       which is retrived by using
       argocd admin initial-password -n argocd
       
       Argo CD active and running -
       ![Screenshot 2024-03-10 225846](https://github.com/chandanb27/guestbook/assets/135106598/b926d271-351a-42e2-a1b0-f01b45a574cc)

         challenge:
         It was difficult to install Argo CD in local cluster MiniKube as system had less disk space and was hard to stay connected to the cluster and run Argo CD. 
         
     3.Install Argo Rollouts:
       Argo rollouts installation documentation URL -
       https://argoproj.github.io/argo-rollouts/

       commands used to install
       kubectl create namespace argo-rollouts
       kubectl apply -n argo-rollouts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml

       Argo rollouts active and running -
       ![Screenshot 2024-03-10 225846](https://github.com/chandanb27/guestbook/assets/135106598/b926d271-351a-42e2-a1b0-f01b45a574cc)


2.Creating the GitOps Pipeline

      1.Dockerize the Application:
        Creating docker image in dockerhub using actions in github 
        dockerhub repository URL - https://hub.docker.com/repository/docker/chandan2706/guest/general

          challenge:
          To configure DockerHub with the Github repository 
          solution:
          To generate dokerhub access key and create new repository secret where username and access key was stored and was mentioned in docker-image.yml file to
          grant access to dockerhub and create docker repository.
        
      2.Deploy the Application Using Argo CD:
        To Configure Argo CD to monitor your Git repository for changes and to automatically deploy changes to your application whenever there is a new commit to 
        the Git repository. This ensures that your application stays up-to-date with the latest changes in the codebase.
        
        Need to add github repository in repositories with username and Fine-grained personal access token to configure with Argo CD.
        
        ![Screenshot 2024-03-10 195052](https://github.com/chandanb27/guestbook/assets/135106598/4b277b0d-db5c-4eaf-8b76-6473f22d940b)

3: Implementing a Canary Release with Argo Rollouts

      1.Define a Rollout Strategy: Utilizing Argo Rollouts to implement advanced deployment strategy like Canary deployment which allows you to safely roll out new
      versions of your application and monitor their performance before fully promoting them to production.

       Added argo-rollout.yaml file with canary deployment strategy with pause duration of 10 min. 
       reference URL - https://raw.githubusercontent.com/argoproj/argo-rollouts/master/docs/getting-started/basic/rollout.yaml
         
     2.Trigger a Rollout:
       Updated argo-rollout.yaml with pause duration of 1h.

     3.Monitor the Rollout: 
       Testing deployment pipeline thoroughly to ensure that everything is working as expected by using Argo Rollouts to monitor the deployment of the new version,
       ensuring the canary release successfully complete.  

       ![Screenshot 2024-03-11 001516](https://github.com/chandanb27/guestbook/assets/135106598/96a53c6b-5d8e-45d5-a67b-537de4be1d2d)

4: Documentation and Cleanup
       
      1.Document the Process:
        Documented the steps followed to set up the GitOps pipeline, including any challenges you encountered and how you addressed them. This documentation will
        be helpful for future reference and knowledge sharing.

      2.Clean Up:
        To remove all resources created during this assignment from the Kubernetes cluster.
        kubectl delete all --all
      

It was my first project using Argo CD which was challenging and was a rewarding learning experience that highlighted the power of GitOps and continuous delivery. 
During which, I learnt GitOps practices to automate the deployment and management of applications in Kubernetes environments.
Key tools and technologies used include Argo CD for continuous deployment, Argo Rollouts for canary deployment strategy,Kubernetes for container orchestration,
docker for dockerizing the application and Git repositories for version control.
