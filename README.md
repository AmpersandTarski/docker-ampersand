# README

## Set environment variable to point to your code
For windows, e.g.: `SET MY_HTDOCS_DIR=c:\dev\htdocs`
For linux/mac: `EXPORT MY_HTDOCS_DIR=/path/to/your/location`

## Deploy your local environment to run Ampersand prototypes
`docker-compose up -d`

## Available services:
* Apache webserver
    * Serves your prototypes from MY_HTDOCS_DIR
    * Available in your browser at `http://localhost:80`
* phpMyAdmin dashboard
    * Available in your browser at `http://localhost:8080`
* MariaDB database
    * Not directly exposed on host

## Generate a prototype
Specify prototype-db as database host using command line option, yaml file or prototype config file

Windows, e.g.: `ampersand <script.adl> --proto %MY_HTDOCS_DIR%\<app-folder-name> --sqlHost=prototype-db`
Linux/mac, e.g.: `ampersand <script.adl> --proto ${MY_HTDOCS_DIR}/<app-folder-name> --sqlHost=prototype-db`

## Navigate to your prototype
If you generate a prototype to e.g. the `MY_HTDOCS_DIR/app1` folder
You can access the prototype in the `http://localhost/app1/public`