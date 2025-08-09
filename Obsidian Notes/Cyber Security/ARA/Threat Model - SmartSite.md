# Threat Model - SmartSite

# Smartsite TM Diagram

* [Smartsite TM Diagram](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-SmartsiteTMDiagram)
* <https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite->
* [Assets](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-Assets)
	* [A-ACR-Token](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-ACR-Token)
	* [A-Bosch-AD-Creds](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Bosch-AD-Creds) 
	* [A-OAuth Client Credentials](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-OAuthClientCredentials)
	* [A-OAuth-Auth-Code](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-OAuth-Auth-Code)
	* [A-Access-Token](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Access-Token)
	* [A-Refresh-Token](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Refresh-Token)
	* [A-Data-Export](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Data-Export)
	* [A-Creds-App-User](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Creds-App-User)
	* [A-SmartSite-User-Data](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-SmartSite-User-Data)
	* [A-Creds](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Creds)
	* [A-Creds-Admin](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Creds-Admin)
	* [A-JWT-Signing-Key](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-JWT-Signing-Key)
	* [A-Logs](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Logs)
	* [A-Images](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Images)
	* [A-DB-Creds](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-DB-Creds)
	* [A-User-Service-Data](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-User-Service-Data)
	* [A-Event-Service-Data](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Event-Service-Data)
	* [A-Company-Service-Data](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Company-Service-Data)
	* [A-Project-Service-Data](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Project-Service-Data)
	* [A-PDF-Service-Data](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-PDF-Service-Data)
	* [A-Notification-Service-Data](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Notification-Service-Data)
	* [A-News-Service-Data](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-News-Service-Data)
	* [A-Stats-Service-Data](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Stats-Service-Data)
	* [A-Activity-Service-Data](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Activity-Service-Data)
	* [A-User-Roles](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-User-Roles)
	* [A-Encryption-Key](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Encryption-Key)
	* [A-Kafka-Events](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Kafka-Events)
	* [A-API-Key](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-API-Key)
	* [A-API-Secret](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-API-Secret)
	* [A-Docker-Images](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Docker-Images)
	* [A-Container-Registry](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-A-Container-Registry)
* [Controls](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-Controls)
	* [C-AuthN](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-AuthN)
	* [C-AuthN-DB](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-AuthN-DB)
	* [C-AuthN-Kube-API](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-AuthN-Kube-API)
	* [C-AuthZ](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-AuthZ)
	* [C-OAuth2.0](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-OAuth2.0)
	* [C-OneTimeUse](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-OneTimeUse)
	* [C-TLS](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-TLS)
	* [C-MFA](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-MFA)
	* [C-Encrypt](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-Encrypt)
	* [C-Account-Lockout](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-Account-Lockout)
	* [C-Web-App-Firewall](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-Web-App-Firewall)
	* [C-DDoS-Protection](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-DDoS-Protection)
	* [C-IP-Whitelisting](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-IP-Whitelisting)
	* [C-Service-Principal](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-Service-Principal)
	* [C-Anchor-Scans](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-Anchor-Scans)
	* [C-JWT-Validation](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-JWT-Validation)
	* [C-JWT-Expiry](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-JWT-Expiry)
	* [C-JWT-Authenticity](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-JWT-Authenticity)
	* [C-RBAC](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-RBAC)
	* [C-Audit-Logs](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-Audit-Logs)
	* [C-API-Key-Validation](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-API-Key-Validation)
	* [C-Alerts](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-Alerts)
	* [C-Monitoring](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-Monitoring)
	* [C-Azure-Key-Vault](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-C-Azure-Key-Vault)
* [Trust Zones](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-TrustZones)
	* [TZ-Internet](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-TZ-Internet)
	* [TZ-Partner-Network](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-TZ-Partner-Network)
	* [TZ-Splunk Cloud](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-TZ-SplunkCloud)
	* [TZ-Confluent Cloud Enterprise](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-TZ-ConfluentCloudEnterprise)
	* [TZ-Bosch Azure VNET](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-TZ-BoschAzureVNET)
	* [TZ-CIAM](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-TZ-CIAM)
	* [TZ-Subnet](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-TZ-Subnet)
	* [TZ-Smartsite Kubernetes Cluster](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Threat%2BModel%2B-%2BSmartSite#ThreatModelSmartSite-TZ-SmartsiteKubernetesCluster)

# Assets

## A-ACR-Token

The access token used by the Developers to authenticate to the Azure Container Registry obtained via Azure Command Line Interface(CLI). 

## A-Bosch-AD-Creds 

The AD credential used by the Developers to access the Kube API Server via Azure Command Line Interface(CLI). 

## A-OAuth Client Credentials

The OAuth clients authenticate with a client ID and a client secret to the Authorization Server.  An attacker with access to these credentials will be able to impersonate these applications and thus obtain OAuth Access Tokens.

## A-OAuth-Auth-Code

Clients executing the Authorization Code flow obtain this code from the Authorization Server after successful user authorization. The client exchanges this code for an access token. This code can only be used once and is valid for five minutes. 

## A-Access-Token

JWT token generated and signed with private key upon receiving of the Authorization code, client credentials, or user credentials (depending on the chosen OAuth flow).  Access tokens expire after 60 mins. This is the JWT issued by Bosch CIAM to verify the caller has been properly authenticated. JWT token is the credential used to communicate with the with the SmartSite system.  

## A-Refresh-Token

Random string that can be used to extend the life-time of access tokens. Clients exchange them together with their credentials for a new access token.

## A-Data-Export

SmartSite customers can export calendar data out of the application in the form of PDF, JSON and CSV. 

## A-Creds-App-User

These are the SmartSite customer user credentials used to authenticate to either the SmartSite Web or Android application. 

## A-SmartSite-User-Data

Android application caches the user application data onto the mobile device to support offline access. The SmartSite user data is stored encrypted.   

## A-Creds

These are the username and password used by Bosch or Partner user to authenticate and operate the local Prometheus, Grafana, Alertmanager, Elasticsearch and Jaeger on the K8s cluster. 

## A-Creds-Admin

There are the Bosch or Partner admin user credentials used to authenticate to the SmartSite Admin Web Application.  

## A-JWT-Signing-Key

The access token(JWT) is signed with the RS256 algorithm with the private keys of RSA. An attacker with access to these signature keys will be able to create valid JWTs.

## A-Logs

The SmartSite system creates and collects various types of application and system logs.  Audit logs are collected from various components and forwarded to Splunk. 

## A-Images

Users of the SmartSite application can upload images to the system. These images are stored in the Azure Blob store and an Azure function is implemented to scale these images if and when required.

## A-DB-Creds

 The SmartSite system has individual databases either MySQL or Cosmos specific to each of the backend services. The services authenticate to the databases using these credentials. These database credentials are stored in the vault. 

## A-User-Service-Data

The SmartSite system has various backend services to perform certain functionality. This represents the data associated with the user service. 

## A-Event-Service-Data

The SmartSite system has various backend services to perform certain functionality. This represents the data associated with the event service. 

## A-Company-Service-Data

The SmartSite system has various backend services to perform certain functionality. This represents the data associated with the company service. 

## A-Project-Service-Data

The SmartSite system has various backend services to perform certain functionality. This represents the data associated with the project service. 

## A-PDF-Service-Data

The SmartSite system has various backend services to perform certain functionality. This represents the data associated with the PDF service. 

## A-Notification-Service-Data

The SmartSite system has various backend services to perform certain functionality. This represents the data associated with the notification service. 

## A-News-Service-Data

The SmartSite system has various backend services to perform certain functionality. This represents the data associated with the news service. 

## A-Stats-Service-Data

The SmartSite system has various backend services to perform certain functionality. This represents the data associated with the statistics service. 

## A-Activity-Service-Data

The SmartSite system has various backend services to perform certain functionality. This represents the data associated with the activity service. 

## A-User-Roles

SmartSite system support various user roles such as Customer Site Manager. Foreman and Back Office admins. These roles associated to users are stored and managed by the User Service.

## A-Encryption-Key

This represents the encryption keys used to encrypt the various services specific databases.  

## A-Kafka-Events

SmartSite system is implemented as an event based system and Apache Kafka is used as the queuing mechanism. 

## A-API-Key

SmartServices authenticate to the Apache Kafka broker with API Key along with a secret. Each service has its own API Key and Secret which are stored in the Azure key vault.

## A-API-Secret

SmartServices authenticate to the Apache Kafka broker with API Key along with a secret. Each service has its own API Key and Secret which are stored in the Azure key vault.

## A-Docker-Images

The Smartsite application is deployed on docker containers managed by Kubernetes. These docker containers would be running images stored in Azure Container Registry maintained by the team.

## A-Container-Registry

Distroless container images are pulled from Google then CI pipeline builds production artifacts and stores in the Azure Container Registry. Anchor Open Source image scanner is used to scan the images stored in the registry for vulnerabilities periodically.

# Controls

## C-AuthN

Authentication processes to limit access to data and resources.

## C-AuthN-DB

Authentication required for database access.

## C-AuthN-Kube-API

The authentication mechanism on the Kube API server which validates credentials before providing access to the Kube API.

## C-AuthZ

Verifying the action that the user is requesting is authorized based on their role (Admin or Foreman, Manager).

## C-OAuth2.0

The authentication mechanism uses OAuth2.0 with Authorization code grant flow.

## C-OneTimeUse

The OAuth Authorization code is one time use only.

## C-TLS

The communication channels between various components are secured with TLS. TLS is a cryptographic protocol that provides communication security over a computer network. The protocol provides:

* Confidentiality, as symmetric cryptography is used to encrypt the data that is transmitted. The keys are generated for each connection.
* Data integrity, as each message is transmitted with a message integrity check (message authentication code). This prevents alteration of data during transmission.
* Authentication, as the identity of the communicating parties is authenticated using public key cryptography.
* For this control, only the server is authenticated.

## C-MFA

The application support 2-factor authentication and second factor code is delivered via phone call.

## C-Encrypt

Data is stored encrypted at rest.

## C-Account-Lockout

The Bosch CIAM credentials are locked after 20 failed login attempts. This is the account lockout policy controlled and managed by CIAM.

## C-Web-App-Firewall

There is the Web application firewall that is a part of the ingress flow offered by Azure application gateway.

## C-DDoS-Protection

This is the DDoS protection offered by the Azure application gateway.

## C-IP-Whitelisting

Incoming request IP addresses are checked to verify if they are allowed to access a resource or not.

## C-Service-Principal

## C-Anchor-Scans

Anchor is used to scan Docker Images for vulnerabilities. 

## C-JWT-Validation

The JWTs are validated to check if for validity and expiry.

## C-JWT-Expiry

JWTs expire as they are valid for only 60 minutes.

## C-JWT-Authenticity

The JWTs are validated and signatures are verified to make sure they are not modified.

## C-RBAC

SmartSite has Role Base Access Control which allows users to access resources which they have privileges for.

## C-Audit-Logs

Various logs are collected such as application logs, kubernetes logs etc. and forwarded to Splunk cloud for monitoring.

## C-API-Key-Validation

The API Key and secret combination are validated by the Apache Kafka broker before granting access.

## C-Alerts

Alerts are generated based on the various error reported by the system.

## C-Monitoring

Azure log analytics are enabled for monitoring. All the various logs are aggregated at Splunk for monitoring purposes. 

## C-Azure-Key-Vault

Azure Key Vault is used for storing credentials and is called when needed by resources in the AKS cluster.

# Trust Zones

## TZ-Internet

This is an external zone of the public internet that inherently has the least amount of trust. 

## TZ-Partner-Network

This zone represents the Novatech network where most of the development team operate from. 

## TZ-Splunk Cloud

Splunk Cloud is leveraged to get a managed Splunk service that collects our application logs, kubernetes logs etc.

## TZ-Confluent Cloud Enterprise

Confluent Platform is used as the commercial version of the Apache Kafka ecosystem. The cloud offering by Confluent is used to get a managed platform.

## TZ-Bosch Azure VNET

Bosch uses Azure as the infrastructure for hosting all the resources. This zone represents the Azure VNET used by Bosch.

## TZ-CIAM

This zone represents the where the Bosch CIAM authentication service resides.

## TZ-Subnet

These zone represents the various subnets which hosts several resources inside the Bosch Azure VNET.

## TZ-Smartsite Kubernetes Cluster

This zone represents the Production cluster deployed in the SmartSite subnet network. This zone hosts the master and worker nodes.
