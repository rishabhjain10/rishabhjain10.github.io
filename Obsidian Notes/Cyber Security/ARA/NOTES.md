

# Interview Notes from 19 Nov 2020 - Lead System Architect

Attendees:

* Benjamin Hoehensteiger (PT/PJ-DCS) : Power Tools, Solutions Architect, Project Owner
* Lars Dülfer : Novatech, Development Lead, Architect, Backend and Infra

* Goal: SamartSite is a Lean collaboration platform designed in a digital way for the construction site. LEAN is a POSTIT method and construction site workers used to plan and track tasks through postit notes and was not scaleable and efficient. SmartSite system can be explained as JIRA for the construction site management and task collaboration.
* TOP 3 Risks:
	* Data Consistency/Integrity : Malicious or unauthorized modification of data
	* Restore from the event log in case of a disaster
	* SPLUNK : Devs dont have access 
	* Kafka cluster:
*  Users(~1300 end users):
	* Construction Site Manager
	* Foreman
	* Admins
* Major Components:
	* Web UI : Can you used by the end users  available over the internet
	* Android App: Can be used by the end users available over the internet
	* Admin UI: Only used by the BOSCH internal back office employees (4-5 admin users)
	* CIAM: Central System for Identity Management, User registration is done here
	* various Services are deployed as PODs in the K8s cluster
	* Every service has its own DB for data storage it can be MYSQL or COSMOS DB
	* Apache Kafka is used for handling message queue
* FLOW
	* End User → Web/Android → CIAM → User Service (SignUp) → Admins(manual approve and assign company, role) → Access SmartSite services
	* Authenticated Requests from User → SmartSite service → Verifies the JWT validity → Decodes user data from JWT and verifies it against the business log and data access i.e. derived data from event log.  
* AuthN:
	* Username and Password based AuthN handled by CIAM 
	* OIDC OAuth2.0 flow with Implicit grant is used currently but moving to PKCE grant flow
	* Successful AuthN yields JWT with refresh tokens valid for 1 hour (60 mins)
	* \*\*\* NO CLAIMS are used for JWTs
	* Each DB has its own username and password for AuthN and these credentials are stored in Azure Key Vault 
	* Services AuthN to DB using credentials stored in KeyVault populated at runtime via Environment variables
* Major Functionalities:
	* Lean Calendar
	* Day Card
	* Upload Files
	* Activities Log
	* Export as PDF/JSON/CSV
	* No password change functionality inside the application.
* Validation:
	* Web Application Firewall performs certain validation , SpringBoot Java application performs some validations 
	* Prepared statements are used for DB interaction
	* \*\*\* NO ACCOUNT LOCKOUT POLICY
	* JWTs are issued by CIAM but validated by the SmartSite services. Each service holds the public key of the verify the JWT signature. The verification key is retrieved from CIAM and only stored in memory
	* AuthZ checks are performed by the service with certain business logic written into the service.
	* Each DB has its own username and password for AuthN and these credentials are stored in Azure Key Vault 
* Data:
	* No Financial data
	* User related data like name, address, telephone etc
	* Data is encrypted at rest i.e each DB is encrypted and has its own encryption key , 
	* ~~?? encryption algorithm~~
	* ~~Kafka at rest is encrypted , encryption algorithm???~~
* Kafka
	* Service Accounts Kafka broker is used to manage topics
	* API Key/Secret combination with a set of ACLs are used to partition the keys
	* Provisioned via Azure Key Vault 
* Logging and Monitoring
	* Application and system logs are collected and forwarded to central repository
	* FluentD is used to collect logs and forward to SPLUNK cloud 
	* Monitored for anomalies and debug
	* ?????~~Are any security specific logs are collected~~   
	* ~~????? Are there anyone from security team auditing these logs~~
	* ~~????? What happens if a security event is detected~~ 
* K8s
	* Smartsite application is deployed into its own dedicated K8s cluster
	* Each service run in its own POD in the cluster
	* Restricted PODs, no shell
	* Base Container Images are Distroless from Google
	* 5 Worker Nodes are running
	* \*\*\*\*\*All the members of the development team have access to the Kube API Server 
	* Developers utilize Azure CLI, AuthN is performed using BOSCH AD creds. 2-factor is enabled and delivered via phone call. ~ 20 members in the development team
	* \*\*\*\* Kube API server is accessible over the Internet
	* \*\*\* No RBAC on the K8s
	* \*\*\*\* No network policy inside the cluster
	* ????Do the PODs have internet access 
	* \*\*\*\*\*\* HTTPS not enabled inside the K8s cluster
* CI/CD
	* Azure DevOps pipeline is utilized for deployments
	* Every service has its own pipeline
	* Containers are uploaded to the Azure Container Registry
	* Helm Chart is used to deploy to the K8s
	* Terraform is used for provisioning Infrastructure

# Interview Notes from 19 Nov 2020 - Project Management

Attendees:

* Stefan Gaa : Product Owner, Aligns the vision, validates it. Binding the Dev, Business and Customers

* Business Requirement and Risks:
	* Impact & Revenue: Gain impact, attract users and revenue
	* Meet the SLAs: 95% availability but No legal implications if that is not met
	* Dependency on CIAM to provide AuthN
	* Attrition (Working with external partners), knowledge loss
* Worst Case Scenario: Refinemy Site is not available
* Incidents:
	* Customers initiating several connections due to networking error
	* BOSCH process related
* 120 construction sites  
* Pentesting is performed once a year and upon major changes
* Sonarqube has rules to perform static analysis of the code built into the pipeline
* Security guidelines are provided by BDO but not enforced
* EISA requirements for SC-2 data classification
* 3 week sprints and defined JIRA flow for change management 

# Interview Notes from 19 Nov 2020 -  Business Owner

Attendees: 

* Sebastian Jackisch (PT/PJ-DCS): Business Owner, CEO, CFO 

* RefinemySite is a Lean collaboration platform, task management and work distribution
* Project started as Smartsite but could not be trademarked so branded as RefinemySite
* Business Requirements:
	* Availability of the Refinemysite application
	* UX/UI ease of use
	* Data Integrity
	* Public Cloud 
* Concern Areas:
	* Kafka Backups - This has been resolved recently 
	* AuthN via CIAM
	* Novatech: Risk of Knowledge Transfer , external developers
* No compliance with PT-standard
* 4 contruction projects from BOSCH are the customers of the system and get good feedback from them
* 130 total construction projects currently running, serving 1300 users 

# Interview Notes from 20 Nov 2020 - Quality Manager

Attendees:

* Axel Gauweiler (PT/PJ-DCS): Bosch employee, Agile Tester

* 3 week sprints is the deployment cycle 
* After 2 weeks, testing is performed 
* Different types of tests are perfoemed like unit testing, regression testing, Pentest round , Sonarqube scans, Authz testing 
	* Static Code Analysis: CI Pipeline sonarqube scans
	* Code Review: Developers Peer review
	* Unite Test: Developers write unit tests
	* End-to-End: Testing team
* Security testing:
	* Sonarqube scans. OWASP top 10 rules are built into it
	* SpotBugs
	* Owasp dependency check
	* Yearly Penetration tests 
	* \*\*\* No involvement of Information Security team in the development , testing or deployment
* There are various environments available for the team and are separated by susbcriptions:
	* Dev
	* Test, Sandbox environment is used for testing
	* Review
	* PROD 
* ~~??? Is there cross environment access enabled?~~
* ~~??? Are there any network or firewall rules to separate envs?~~ 
* QA team is just one person and he also has access to PROD as the back office admins
* PROD data is used in test for one of the BOSCH projects , data is annonymized
* User stories have acceptance criteria defined and has positive and negative tests
* Anchor is used for base docker Image Scanning 
* \*\*\*\*\*Not allowed to used any tools

# Interview Notes from 20 Nov 2020 - Developers (Lead Developers/Integration Engineers)

Attendees:

* [christian.schaible@novatec-gmbh.de](https://sig-confluence.internal.synopsys.com/display/~vkarhade/NOTESmailto:christian.schaible@novatec-gmbh.de): Sr. Software Engineer, Back-end Engineer
* Rodrigues Daniel Jose (TT/PJ-PT-Av): Front-end Developer
* Oliveira Daniel (TT/PJ-PT-Av) : Android Team
* 'Lars Dülfer (lars.duelfer@[novatec-gmbh.de](http://novatec-gmbh.de/)): Backend Knowledge and architect
* Peter Kleimann : Infra, CI/CD and Azure

* All the code is hosted on the Azure. The team uses AzureDevops and every service has its own repository
* Size of the development team is 20
* Tech Stack:
	* Angular for Frontend, regex, typescript and ng-rx store
	* ??? Backend Services
	* MySQL DB
	* Cosmos DB
	* K8s
	* Docker
	* Apache Kafka
* \*\*\*\* All the developers can access all the repository
* \*\*\*\* No secure Coding standards
* Error in the deployment or build breaking creates Email and Slack notifications 
* Code repository can be accessed in two ways:
	* UI : Bosch AD Creds , 2 factor delivered via phone
	* CLI : Access Keys and Cert Based AuthN
* Validations:
	* File Upload:
		* Mime type is checked and Only allows JPG, PNG, GIF
		* Size 5 MB
	* \*\*\* No input validations or output encoding performed relies on Angular and JavaSpringBoot framework
	* Validations are performed on both client and server side
* \*\*\*\*\* Lack of Security Headers:
	* ~~?? Clickjacking~~ 
	* ~~??Cache control Headers~~
	* ~~??CSRF~~
* OAuth
	* \*\*\*\* No session timeout due to inactivity
	* \*\*\* Access Token and Refresh tokens are stored on Browser Session Storage
	* ~~??? OAuth Auth Code is one time use only~~ 
	* Auth code is bound to client
	* Redirect URIs are validated and whitelisted
* Android Application
	* Written in Kotlin
	* Access Token is stored encrypted in Shared Prefs using AES-256
	* Encryption Key is stored on Android Key Store
	* ~~??? Does every user have its own encryption key ? How are these encryption keys generated ?~~
	* All the user data is stored in the SQL-lite DB , This DB is encrypted using sqlcipher
	* \*\*\*\* No Certificate Pinning
	* \*\*\*\* No root detection
	* \*\*\*\* No Binary Obfuscation
	* Application use webviews to display license information
	* No sensitive data in Android System Logs
	* AndroidManifest.xml
		* min API version 23
		* Allow backup false
		* ~~?? Debug flag~~
		* ~~?? Exported Activities~~
* Backups:
	* DB backups are performed every mins by Azure
	* Kafka - Kafka is used as multi-cluster. Restore mechanism is under development
*  K8s
	* \*\*\*\* All the services are deployed in its own PODs under the default namespace
	* Each service has its own account to access the K8s API Server
	* \*\*\* No Docker trust Registry
		* Distroless container Images are pulled from Google
	* \*\*\*\* No automated Certificate and Credential rotation functionality
		* Backlog has it planned to implement that
	* \*\*\*\* No periodic review of entitlements
	* Anchor is used to scan container images for Vulnerabilities
	* \*\*\*\*\*\* Container Images are not signed and verified  
	* \*\*\*\*\* Container Images can be downloaded from the Internet
	* SSH access is not enabled
	* Secrets are stored in the Azure key vault
	* \*\*\*\* Everyone from the development team can access the Vault
	* 5 Worker nodes are deployed in PROD cluster across 3 zones
	* \*\*\*\*\* No runtime monitoring in the cluster
* LOGS: Azure log analytics are enabled for monitoring 
* Patch Management: Azure updates in the background
* \*\*\*\* No restriction to use thrid-party libraries, No list of approved libraries
