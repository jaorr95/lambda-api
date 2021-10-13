# LAMBDA-PYTHON-TERRAFORM

### API

Proyecto que levanta una api desarrollada en python. Esta api es desplegada en lambda de AWS usando el framework serverless. 

Una vez deplegado se puede acceder a la api usando a traves de la siguiente url:

* https://api.jesus-lahaus.tk

El serverless crea los siguientes recursos:

* Lambda
* ApiGateway
* Cloudwatch logs
* Route53


### INFRAESTRUCTURA

La infraestructura es deplegada usando Terraform y consta de los siguientes recursos:

* Vpc
* Security groups
* EC2
* RDS Aurora Serverles
* ELB
* ACM
* Route53
* Parameter Store
* Cloudwatch logs

En la instancia de ec2, esta corriendo ADMINER para poder ingresar desde afuera de la vpc a la instancia de RDS. Se puede acceder a traves de la siguiente url:

* https://adminer.jesus-lahaus.tk