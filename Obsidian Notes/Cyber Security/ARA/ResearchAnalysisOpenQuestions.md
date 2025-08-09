# Research/Analysis/OpenQuestions

[Research/Analysis/OpenQuestions](https://sig-confluence.internal.synopsys.com/pages/viewpage.action?pageId=718890070)

1. OAuth and JWT
	1. Are access tokens scoped commensurate with the business needs?
	2. What is the value of scope in the JWT token?
	3. What are the claims used within the ID Token? Please mention them. Also, specify if these claims  are validated at the server end.
	4. How is the integrity JWT token verified? Please specify if there is any validation in place for the JWT signature. 
	5. What mechanism is used to identify the key (e.g. are you using the optional kid claim in the JWT?) that will be used to validate the JWT?
	6. Are refresh tokens bound to a specific OAuth Client? 
	7. What is the length and complexity/entropy of the authorization code used?
	8. How long is the authorization code valid for?
	9. Can an authorization code generated be re-used multiple times?
	10. Is the authorization code bound to the client generating the request?
	11. Is the state parameter implemented in the authn/authz request?
		1. If yes, please elaborate on the implementation of the state parameter.
	12. Is there any input validation performed on the redirect\_uri parameter?
	13. Can you please provide a sample Access and refresh Token?
2. User and Admin Web App
	1. Is there an account lockout policy for failed login attempts?
		1. If yes, after how many failed login attempts user gets locked out?
	2. Does the application use "Strict-Transport-Security" header? If yes, specify value of the header set in response.
	3. Does the application use "Content-Security-Policy" header? If yes, please specify it's value.
	4. Does the application use Cross-Origin Resource Sharing header? If yes, please specify it's value.
	5. Does the application has anti-clickjacking mechanism? If yes, specify controls implemented to block clickjacking.
	6. What controls are in place to prevent storage of cache in the web browser? Specify "Cache-Control" header value, if set in HTTP response.
	7. Does the application use any third party/opensource components? If yes, does it have the latest version and is checked for well known CVEs?
	8. The back office admins activate user and assigns user roles.
		1. Where are these user roles stored ?
		2. Who creates back office admins ?
		3. How are different user types in the system provisioning and de-provisioning?
3. Android Application
	1. Access tokens and user data is stored AES-256 encrypted in Shared-prefs.
		1. How is the encryption key generated ?
		2. Is the same encryption key used for all the users?
	2. Androidmanifest.xml file
		1. What is the value of  "android:allowBackup" attribute ?
		2. What is the value of  "android:debuggable" attribute?
		3. Is there any Activity, a Service, a Content Provider or a Broadcast Receiver components with "android:exported"="true" 
		4. What are all the permissions that the application requests?
	3. Does the application use any third party/opensource components? If yes, does it have the latest version and is checked for well known CVEs?
	4. Does the application obfuscate code that exposes sensitive business logic of the application?
4. Kubernetes
	1. What is the value of the automountServiceAccountToken ?
	2. Have you enabled Azure Network Policies at the time of creation of the cluster?
	3. Have you secured Kubelet ports?
	4. How does the Kubelete API authenticate and authorizes the request? Are authentication and authorization enabled?
	5. Have you configured the Pod Security Policy admission controller?
	6. Have you secured the node SSH access to only via Kubernetes?
	7. Are there unwanted/unused kernel module on the node?
	8. Can pods access metadata APIs of the instances of Kubernetes worker nodes that are VMs in the cloud such as Azure VM ?
	9. What controls exists in regards to Egress (traffic going out from cluster to internet)?
5. Docker
	1. Are you running the Docker a a rootless container?
	2. What controls exist on the container registry to ensure that the registry from which container images are downloaded is secure?
	3. What permissions are granted to the application when it runs in a container?
	4. Are you mounting container's root file system as read-only?
	5. Do you have continuous security vulnerability scanning enabled for your containers and images?
6. Azure Key Vault
	1. Who or which team manages the Vault?
		1. Who can add/delete/modify keys ?
	2. Is this Vault dedicated only for SmartSite system? or is it shared across different systems?
	3. is the Vault shared across different environments (Dev, PROD etc.)
	4. Is Key Vault logging enabled ?
		1. Where are the logs stored ?
	5. Do you perform regular back ups of your vault on update/delete/create of objects within a Vault?
	6. Are soft delete and purge protection recovery options enabled?
7. Apache Kafka
	1. Where are the Kafka backups stored?
		1. Is it encrypted at rest ?
	2. Is the connection mTLS or TLS ?
	3. Are there any rate-limiting controls ?
	4. Is there any account lockout policy? 
	5. What encryption algorithm is used to encrypt Kafka?
8. Logging and Monitoring
	1. Are any security specific logs are collected ?  
	2. Are there anyone from security team auditing these logs ?
	3. What happens if a security event is detected ?
	4. Is the application monitored or will be on-boarded by Bosch's Security Operations Center (SOC)? (for detecting malicious activities or uncommon behavior)
9. Misc.
	1. What encryption algorithm is used to encrypt the Databases? How is the key generated ? 
	2. Is Azure Devops Server used for source code version control?
	3. The application is accessible over HTTPS.
		1. What TLS protocols version is enabled?
		2. What ciphers are supported ?
	4.  We were told testing of the application’s functionality is performed through the user interface. Is there any testing performed on the backend services and APIs ?
	5. How does the Spring cloud API gateway authenticate with backend Services ?
	6. Which component performs the Authorization check ?
	7. How are the different environments separated? Is there cross environment access enabled?
	8. What infrastructure controls are in place to keep environments separated? Are there any network or firewall rules to separate envs?
	9. Can you please provide the version number of the following:
		1. Angular
		2. MySQL DB
		3. Cosmos DB
		4. Kafka
		5. Spring Boot
		6. Sonarqube
		7. K8s
		8. Docker

Follow-Up Questions

1. Developers use Azure CLI to authenticate to the Kube API Server. What creds they use for AuthN:
	1. Bosch AD Creds with 2-factor  OR Certificate with Access Key ?
2. Operator users access the Metric and Tracing applications deployed on the cluster. What creds they use for AuthN:
	1. Bosch AD Creds with 2-factor  OR Certificate with Access Key ?
3. Container Images are stored in Azure Container Registry.
	1. Is there a separate registry/repository for PROD container and Dev Containers ?
	2. Who can access this Azure Container repository ?
	3. Is there any AuthN for accessing this repository ? If yes how is it done?
	4. Who can upload container images to this repository ?
	5. Is the Azure Container registry be accessed over HTTP or HTTPS ?
4. Base Images are downloaded Google (Distroless Images)
	1. Who downloads these images from Google?
	2. Where are these base images stored ?
5. Docker Images are scanned using Anchor.
	1. When does this scan is performed when the images are downloaded from Google or when production images are created for deployment ?
	2. Are these scans periodic like every day, week or month ?
	3. Are these scans automated or manual?
6. Is there are runtime scanning and monitoring performed on the cluster for vulnerabilities or misconfigurations?
	1. Are CIS benchmark scans run against the cluster ?
7. The Spring Cloud API Gateway connects to each of the backend services. Each service validates the OAuth token but:
	1. How does the Gateway Authenticate itself to these backend services ?
	2. It is System to System Authentication or Service to Service Authentication? 
8. Is the Azure Key Vault in the same subnet as Azure data stores(MySQL and Cosmos DB) and K8s cluster ?
9. Is the Azure Container registry in the same subnet as Azure data stores(MySQL and Cosmos DB) and K8s cluster ?
