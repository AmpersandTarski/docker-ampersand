For now just notes:

- How to get up and running
  Run *./docker/build.sh* to build the initial ampersand container that serves as a base for the RAP3 application (or any other Ampersand application).
  This base image holds all required packages and the (at that moment) latest version of the ampersand compiler.
  The workflow around this container can/should be improved since now the easiest way to rebuild is to remove the container (*docker rmi ampersand:latest*)

- run the ampersand container interactively to test the compiler etc..:
  *docker run -ti --rm ampersand-prototype:latest /bin/bash*

https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#volume
https://ampersandtarski.gitbooks.io/the-tools-we-use-for-ampersand/deploying-rap3-with-azure.html
