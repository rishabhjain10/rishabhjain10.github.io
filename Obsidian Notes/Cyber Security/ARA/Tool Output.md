# Tool Output

A-1 : A-Cert During SSL/TLS authentication, the client (in this case the Web and Mobile) and the server (in this case the Azure Application Gateway and Load Balancer) exchange certifi-cates to assert each other’s identities. The client stores the client-side certificate that holds its public key and public key’s association with its identity.
A-2 : A-Access-KeyThis is the credential used by the Developers to authenticate to the Kube API Server via Command Line Interface(CLI).
A-3 : A-OAuth Client CredentialsThe OAuth clients authenticate with a client ID and a client secret to the Authorization Server. An attacker with access to these credentials will be able to impersonate these applications and thus obtain OAuth Access Tokens.
A-4 : A-OAuth-Auth-CodeClients executing the Authorization Code flow obtain this code from the Authorization Server after successful user authorization. The client exchanges this code for an access token. This code can only be used once and is valid for five minutes.
A-5 : A-Access-TokenJWT token generated and signed with private key upon receiving of the Authorization code, client credentials, or user credentials (depending on the chosen OAuth flow). Access tokens expire after 60 mins. This is the JWT issued by Bosch CIAM to verify the caller has been properly authenticated. JWT token is the credential used to communicate with the with the SmartSite system.
A-6 : A-Refresh-TokenRandom string that can be used to extend the life-time of access tokens. Clients exchange them together with their credentials for a new access token.
A-7 : A-Data-ExportSmartSite customers can export calendar data out of the application in the form of PDF, JSON and CSV.
A-8 : A-Creds-App-UserThese are the SmartSite customer user credentials used to authenticate to either the SmartSite Web or Android application.
A-9 : A-SmartSite-User-DataAndroid application caches the user application data onto the mobile device to support offline access. The SmartSite user data is stored encrypted.
A-10 : A-CredsThese are the username and password used by Bosch or Partner user to authenticate and operate the local Prometheus, Grafana, Alertmanager, Elasticsearch and Jaeger on the K8s cluster.
A-11 : A-Creds-AdminThere are the Bosch or Partner admin user credentials used to authenticate to the SmartSite Admin Web Application.
A-12 : A-JWT-Signing-KeyThe access token(JWT) is signed with the RS256 algorithm with the private keys of RSA. An attacker with access to these signature keys will be able to create valid JWTs.
A-13 : A-LogsThe SmartSite system creates and collects various types of application and system logs. Audit logs are collected from various components and forwarded to Splunk.
A-14 : A-ImagesUsers of the SmartSite application can upload images to the system. These images are stored in the Azure Blob store and an Azure function is implemented to scale these images if and when required.
A-15 : A-DB-CredsThe SmartSite system has individual databases either MySQL or Cosmos specific to each of the backend services. The services authenticate to the databases using these credentials. These database credentials are stored in the vault.
A-16 : A-User-Service-DataThe SmartSite system has various backend services to perform certain functionality. This represents the data associated with the user service.
A-17 : A-Event-Service-DataThe SmartSite system has various backend services to perform certain functionality. This represents the data associated with the event service.
A-18 : A-Company-Service-DataThe SmartSite system has various backend services to perform certain functionality. This represents the data associated with the company service.
A-19 : A-PDF-Service-DataThe SmartSite system has various backend services to perform certain functionality. This represents the data associated with the PDF service.
A-20 : A-Notification-Service-DataThe SmartSite system has various backend services to perform certain functionality. This represents the data associated with the notification service.
A-21 : A-News-Service-DataThe SmartSite system has various backend services to perform certain functionality. This represents the data associated with the news service.
A-22 : A-Stats-Service-DataThe SmartSite system has various backend services to perform certain functionality. This represents the data associated with the statistics service.
A-23 : A-Activity-Service-DataThe SmartSite system has various backend services to perform certain functionality. This represents the data associated with the activity service.
A-24 : A-User-RolesSmartSite system support various user roles such as Customer Site Manager. Foreman and Back Office admins. These roles associated to users are stored and managed by the User Service.
A-25 : A-Encryption-KeyThis represents the encryption keys used to encrypt the various services specific databases.
A-26 : A-Kafka-EventsSmartSite system is implemented as an event based system and Apache Kafka is used as the queuing mechanism.
A-27 : A-API-KeySmartServices authenticate to the Apache Kafka broker with API Key along with a secret. Each service has its own API Key and Secret which are stored in the Azure key vault.
A-28 : A-API-SecretSmartServices authenticate to the Apache Kafka broker with API Key along with a secret. Each service has its own API Key and Secret which are stored in the Azure key vault.
A-29 : A-Docker-ImagesThe Smartsite application is deployed on docker containers managed by Kubernetes. These docker containers would be running images stored in Azure Container Registry maintained by Ops team.
A-30 : A-Container-RegistryDistroless container images are pulled from Google then CI pipeline builds production artifacts and stores in the Azure Container Registry. Anchor Open Source image scanner is used to scan the images stored in the registry for vulnerabilities periodically.
A-31 : A-ACR-TokenThe access token used by the Developers to authenticate to the Azure Container Registry obtained via Azure Command Line Interface(CLI).
A-32 : A-Bosch-AD-CredsThe AD credential used by the Developers to access the Kube API Server via Azure Command Line Interface(CLI).

### **Controls**

C-1 : C-AuthNAuthentication processes to limit access to data and resources.
C-2 : C-AuthN-DBAuthentication required for database access.
C-3 : C-AuthN-Kube-APIThe authentication mechanism on the Kube API server which validates credentials before providing access to the Kube API.
C-4 : C-AuthZVerifying the action that the user is requesting is authorized based on their role (Admin or Foreman, Manager).
C-5 : C-OAuth2.0The authentication mechanism uses OAuth2.0 with Authorization code grant flow.
C-6 : C-OneTimeUseThe OAuth Authorization code is one time use only.
C-7 : C-TLSThe communication channels between various components are secured with TLS. TLS is a cryptographic protocol that provides communication security over a computer network. The protocol provides:Confidentiality, as symmetric cryptography is used to encrypt the data that is transmitted. The keys are generated for each connection.Data integrity, as each message is transmitted with a message integrity check (message authentication code). This prevents alteration of data during transmission.Authentication, as the identity of the communicating parties is authenticated using public key cryptography.For this control, only the server is authenticated.
C-8 : C-MFAThe 2-factor authentication is enabled for Developers to access Kube API Server and second factor code is delivered via phone call.
C-9 : C-EncryptData is stored encrypted at rest.
C-10 : C-Account-LockoutThe Bosch CIAM credentials are locked after 20 failed login attempts. This is the account lockout policy controlled and managed by CIAM.
C-11 : C-Web-App-FirewallThere is the Web application firewall that is a part of the ingress flow offered by Azure application gateway.
C-12 : C-DDoS-ProtectionThis is the DDoS protection offered by the Azure application gateway.
C-13 : C-IP-WhitelistingIncoming request IP addresses are checked to verify if they are allowed to access a resource or not.
C-14 : C-Service-PrincipalAn Azure service principal is an identity created for use with applications, hosted services, and automated tools to access Azure resources. This access is restricted by the roles assigned to the service principal, giving you control over which resources can be accessed and at which level.C-15 : C-Anchor-ScansAnchor scans all images in the Azure Container Registry periodically.
C-16 : C-JWT-ValidationThe JWTs are validated to check if for validity and expiry.
C-17 : C-JWT-ExpiryJWTs expire as they are valid for only 60 minutes.
C-18 : C-JWT-AuthenticityThe JWTs are validated and signatures are verified to make sure they are not modified.
C-19 : C-RBACSmartSite has Role Base Access Control which allows users to access resources which they have privileges for.
C-20 : C-Audit-LogsVarious logs are collected such as application logs, kubernetes logs etc. and forwarded to Splunk cloud for monitoring.
C-21 : C-API-Key-ValidationThe API Key and secret combination are validated by the Apache Kafka broker before granting access.
C-22 : C-AlertsAlerts are generated based on the various error reported by the system.
C-23 : C-MonitoringAzure log analytics are enabled for monitoring. All the various logs are aggregated at Splunk for monitoring purposes.
C-24 : C-Azure-Key-VaultAzure Key Vault is used for storing credentials and is called when needed by resources in the AKS cluster.
