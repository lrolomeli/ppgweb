# ppgweb
nginx web server to host plasticos plasa intranet

to create web restricted access modify the default.conf file
and create an .htpasswd using  

  sudo apt install apache2-utils  
  htpasswd -c ./.htpasswd username  

this must create a file in your local pc that the docker compose will copy to the container
