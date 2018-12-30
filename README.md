## Example for use secrets in Docker in mode Swarm

**This example works in Docker 1.13 and higher**

For show how secrets works in swarm mode, we use two images: **postgres and dpage/pgadmin4**

Also, we used three secrets:
 * pg-username
 * pg-password
 * pg-bdd
 
To establish a connection between two services (postgres,pgadmin4) we created a network: **my-lab**
 
To raise the services you have to run the script: **script.sh**

        sh ./script.sh
        
After that you can see that you have two services running (docker service ls) in your machine: 

-   pg-test-secret
-   pgadmin (exposed in **port 99**)   

**NOTE: This example just works with Docker in Swarm mode. You can found more information about this feature here: https://docs.docker.com/engine/swarm/secrets**


