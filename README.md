# README

Different aspects of the Ampersand user's environment can be containerized
1. Ampersand compiler
1. Modelling environment for Ampersand user (incl. VSCode extensions)
1. Prototype environment, including:
    * Apache webserver with PHP
    * Ampersand compiler
    * PHP-composer
    * NPM (Node Package Manager)
    * Gulp
1. Multi-stage prototype build, only:
    * Apache webserver with PHP
    * Generated code
1. Prototype database
    * MariaDB with default user/password

A docker-compose file is available to deploy prototype, database and supporting tools (like phpMyAdmin)

## Ampersand compiler
To run the Ampersand compiler, you can easily use a Docker image from:
`docker.pkg.github.com/ampersandtarski/ampersand/ampersand`

Different tags are available, e.g.:
* :latest -> development branche
* :stable -> master branche
* :[branch] -> specific branch
* :v3.17 -> specific tags/releases

## Modelling environment for Ampersand user (incl. VSCode extensions)
Not yet implemented

## Prototype environment

## Multi-stage prototype build

## Prototype database

## Deploy your local environment to run Ampersand prototypes
`docker-compose up -d`

Available services:
* Apache webserver
    * Serves your prototypes from MY_HTDOCS_DIR
    * Available in your browser at `http://localhost:80`
* phpMyAdmin dashboard
    * Available in your browser at `http://localhost:8080`
* MariaDB database
    * Not directly exposed on host