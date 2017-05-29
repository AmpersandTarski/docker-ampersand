For now just notes:

- how to get up and running
  run *./build-basecontainers.sh* to build the initial ampersand container that serves as a base for the RAP3 application
  this base images holds all required packages and the (at that moment) latest version of the ampersand compiler
  the workflow around this container can/should be improved since now the easiest way to rebuild is to remove the container (*docker rmi ampersand:latest*)

- run the ampersand container interactively to test the compiler etc..:
  *docker run -ti --rm ampersand:latest /bin/bash*

https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#volume
https://ampersandtarski.gitbooks.io/the-tools-we-use-for-ampersand/deploying-rap3-with-azure.html
