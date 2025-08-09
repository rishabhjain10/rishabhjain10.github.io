# Findings- Refinemy Site

*  Inadequate controls on the Kube API Server: All the members of the development team have access to the Kube API Server, Kube API server is accessible over the Internet

* Kubernetes Network Policies Not Implemented
* Network Traffic is Not Encrypted Between Nodes : HTTPS not enabled inside the K8s cluster
* No Secure Coding standards being followed
* No session timeout due to inactivity 
		Insecure Storage of OAuth Access Tokens at Browser
	
* Certificate Pinning Not Used
* No root detection
* Pods Running with Default Service Account
* Kubernetes Default Namespace hosts SmartSite system: All the services are deployed in its own PODs under the default namespace
*  ~~No Docker trust Registry: (~~~~Distroless container Images are pulled from Google,  Container Images can be downloaded from the Internet)~~
		Application Secrets and Keys Are Not Rotated: No automated Certificate and Credential rotation functionality
	
*  Entitlements are not actively reviewed: No periodic review of entitlements
* Docker Images are Not Signed: Container Images are not signed and verified
* Deployed Containers have Internet Access: PODs can be deployed with internet access  
* No Segregation of Privileges: Everyone from the development team can access the Vault and Data Stores (other resources on Azure VNET)
* Lack of Container Run-Time Monitoring: No runtime monitoring in the cluster
* \*\* No restriction to use third-party libraries, No list of approved libraries
* \*\* OAuth Implicit Grant flow was used → Plans is to move to Auth Code grant with PKCE
* No 2-factor authentication for Back office Admin Users
		Missing IT security responsible
	
* No Egress Filtering

* [Asset Relevant Risks](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-AssetRelevantRisks)
	* [Inadequate controls on the Kubernetes API Server](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-InadequatecontrolsontheKubernetesAPIServer)
	* [Lack of Container Run-Time Monitoring](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-LackofContainerRun-TimeMonitoring)
	* [Kubernetes Network Policies Not Implemented](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-KubernetesNetworkPoliciesNotImplemented)
	* [Network Traffic is Not Encrypted Between Nodes](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-NetworkTrafficisNotEncryptedBetweenNodes)
	* [Pods Running with Default Service Account](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-PodsRunningwithDefaultServiceAccount)
	* [Kubernetes Default Namespace hosts SmartSite system](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-KubernetesDefaultNamespacehostsSmartSitesystem)
	* [Docker Images are Not Signed](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-DockerImagesareNotSigned)
	* [Deployed Containers have Internet Access](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-DeployedContainershaveInternetAccess)
	* [No Egress Filtering](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-NoEgressFiltering)
	* [Weak Session Management](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-WeakSessionManagement)
	* [No 2-factor authentication for Back office Admin Users](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-No2-factorauthenticationforBackofficeAdminUsers)
	* [Insecure Storage of OAuth Access Tokens at Browser](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-InsecureStorageofOAuthAccessTokensatBrowser)
	* [No Root Detection](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-NoRootDetection)
	* [Certificate Pinning Not Used](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-CertificatePinningNotUsed)
* [Process-Based Risks](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-Process-BasedRisks)
	* [Missing IT security responsible](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-MissingITsecurityresponsible)
	* [No Secure Coding standards being followed](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-NoSecureCodingstandardsbeingfollowed)
	* [Entitlements are not actively reviewed](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-Entitlementsarenotactivelyreviewed)
	* [Application Secrets and Keys Are Not Rotated](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-ApplicationSecretsandKeysAreNotRotated)
	* [No Segregation of Privileges](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-NoSegregationofPrivileges)
* [CI-Team Related Risks.](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Findings-+Refinemy+Site#FindingsRefinemySite-CI-TeamRelatedRisks.)

# Asset Relevant Risks

## Inadequate controls on the Kubernetes API Server

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | 1   | 3   | 3   |     |

**Source**: Interviews

**Threat Description**

As SmartSite team size is small, hence the responsibilities are not granularly distributed, and neither is the access privileges. All the members of the development team have access to the Kubernetes API server, the Kubernetes API server provides a single connection point for requests to perform actions within a cluster. In addition to that currently Kubernetes API server is accessible over the internet. Having access to Kubernetes API server potentially provided full access to the cluster and resources deployed inside the cluster.

**Impact: High**

All the developers have full cluster admin privileges to the Kubernetes cluster.

**Likelihood: Low**

2-factor authentication is enabled for accessing the Kubernetes API server. Access to actions are logged and monitored. 

**Mitigation measures**

Best practice is to implement the principle of segregation of duties - all the members of the development team should not have any or not complete access to the production environment.

* Use Kubernetes RBAC and Azure AD-integration to secure the API server and provide the least number of permissions required to a scoped set of resources, such as a single namespace. Implement RBAC on the Kube API server with roles and role binding providing least privileges to perform their duties
* Access to Kube API server from the Internet must be removed. Kube API server should only be accessible from Bosch Network or whitelisted Partner IP addresses .

## Lack of Container Run-Time Monitoring

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
<<<<<<< HEAD
| --------- | ------ | ------------ | ------------- | ---------- | ------ | -------- | --------- |
|           |        |              |               | 2          | 3      | 6        |           |
=======
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | 2   | 3   | 6   |     |
>>>>>>> 8b00bfe5587503ce9cfb74d9f742ec72faa77f39

**Source**: Interviews

**Threat Description**

Once a container is deployed, run-time monitoring protects the container application environment from malicious attackers by monitoring network connections and analyzing container and host activity. SmartSite Docker images are scanned for vulnerabilities when built and pushed to the Azure Container Registry but there is currently no real-time scanning or monitoring implemented once these containers are deployed.

**Impact: High**

An unmonitored and possibly untraceable malicious attacker could compromise deployed Docker images that contain sensitive information w.r.t SmartSite. Patching an intrusive data breach can also be very expensive with regards to fiscal and human resources.

**Likelihood: Medium**

The likelihood is medium because SmartSite application that is deployed in containers are accessible by internet users which makes these containers vulnerable to both internal and external attackers. Traditional network security solutions like firewalls, WAFs, proxies, and endpoint protection mechanisms help in securing the network perimeter, but they do not examine and protect internal container network traffic.

**Mitigation measures**

Containers in production should have end-to-end protection which includes the entire build-ship-deploy lifecycle. Run-time monitoring can be implemented using tools like Twistlock Prisma Cloud or Sysdig Falco. More information about run-time monitoring security tools and how to use them can be found from the following links:
• <https://docs.paloaltonetworks.com/prisma/prisma-cloud/19-11/prisma-cloud-compute-edition-admin/runtime_defense/runtime_defense_overview.html>
• <https://sysdig.com/opensource/falco/>

## Kubernetes Network Policies Not Implemented

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | All Threat Classes | Human-Malicious | 2   | 4   | 8   |     |

**Source**: Interviews

**Threat Description**

Kubernetes Pods are not isolated by default and can accept traffic from any source. Network policies act as firewall and specifies how a group of pods are allowed to communicate. Isolation can be introduced by associating a NetworkPolicy with the pods in a namespace which will ensure that the pods reject any connection that is not allowed by the policy. In the current configuration, no NetworkPolicy has been configured by the team.

**Impact: Very High**
Pods running without a network policy will accept traffic from any source that can lead to compromise of pods and eventually compromise of sensitive data.

**Likelihood: Medium**
Likelihood is considered medium as the application is hosted in Azure VNET.

**Mitigation measures**

* Team should ensure that they implement network policies for their namespaces.
* Restrict pod-to-pod network communication within the namespace. Define Kubernetes network security policy that allows network traffic from a pod to another pod based on the need.
* A default deny policy should be created which denies all traffic except the ones that are explicitly allowed.
* More information can be found in the links below.
	* <https://kubernetes.io/docs/concepts/services-networking/network-policies/>
	* <https://docs.projectcalico.org/security/kubernetes-network-policy>

## Network Traffic is Not Encrypted Between Nodes

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | Information Disclosure | Human-Malicious | 2   | 4   | 8   |     |

**Source**: Interviews

**Threat Description**

Smartsite is deployed as several microservices in Kubernetes along with other application such Spring Cloud API Gateway, Metric and Tracing applications that share nodes the cluster is running on. The network traffic between nodes is not encrypted in the current setup. Team mentioned that the traffic in the control plane is encrypted (i.e. traffic to API server, etcd etc.), however, the traffic in data plane is not encrypted.

**Impact : Critical**

Unencrypted traffic can be intercepted by anyone who is present on the same network. This could lead to leakage of sensitive information including credentials to databases.

**Likelihood: Medium**

Since the attacker needs to be in Bosch VNET network zone to intercept traffic, the likelihood is considered Medium. 

**Mitigation measures**

Team should utilize the following guidance provided by UCP for encrypting network traffic.

* <https://docs.docker.com/ee/ucp/kubernetes/kubernetes-network-encryption/>

## Pods Running with Default Service Account

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | Information Disclosure | Human-Malicious | 1   | 3   | 3   |     |

**Source**: Interviews

**Threat Description**

The SmartSite application is running on containers in Kubernetes cluster. Service accounts are used in Kubernetes to authenticate containers and pods. In the current setup, all the pods and containers are running under default service account.

**Impact: High**

It is against the best practice to utilize default service account in production environment as it has wide range of permissions.

**Likelihood: Low or Medium**

The likelihood is considered low as a malicious user will have to be able to compromise a pod on the cluster or be able to create a new pod in the same namespace.

**Mitigation measures**

* The team should disable default service account by automountServiceAccountToken: false on the service account. This will prevent any newly created pod or container from being automatically assigned to the default service account.
* Different service accounts should be created for different services to better manage authorization and access required by the pods and containers.

## Kubernetes Default Namespace hosts SmartSite system

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | Tampering, Information Disclosure, Non-repudiation | Human-Malicious | 4   | 2   | 4   |     |

**Source**: Interviews

**Threat Description**

SmartSite is deployed on Azure Kubernetes Service Cluster, it hosts all of the backend services (like User Service, Company Service, Project Service), Metrics and Tracing system for SmartSite team (Elasticsearch, Alertmanager & Jaeger, etc.) and Spring Cloud API Gateway. Currently all of these system components are hosted in the default namespace. This is against the best practice to not utilize default namespace in production systems.

**Impact: Medium**

Any pod that does not have a namespace specified is assigned to default namespace. It is possible for any team member to spin pods in the default namespace and read or modify metrics & tracing information maintained by Operators.

**Likelihood: Medium**

All the team members have access to Kubernetes cluster via Kube API server and the access is logged and monitored. 

**Mitigation measures**

Team should refrain from hosting anything related to production systems in default namespace. 

## Docker Images are Not Signed

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | Tampering | Human-Malicious | 2   | 3   | 6   |     |

**Source**: Interviews

**Threat Description**

SmartSite services are deployed as containers hosted on a Azure Kubernetes Service Cluster using docker images. The images are created from the code written by the development team however, the images are not signed. The signing of images introduces a chain of custody that enables verification of container in-tegrity. It provides assurance that the image was not modified after being published in addition to providing verification of the publisher.

**Impact: High**

If an attacker can maliciously modify the docker image used by SmartSite platform, it can compromise the data that handled by SmartSite services.

**Likelihood: Low**

The SmartSite system is using Azure Container Registry for storing docker images. The fact that the containers can access internet and these images are scanned with Anchor the likelihood is considered low.

**Mitigation measures**

* Utilize the Docker’s Content Trust (DCT) model to verify the publisher and integrity of the images.
* Ideally an automated image publisher (e.g. Jenkins) should sign the image tags.
* DCT should be enabled for the docker clients consuming the images so only signed images can be pulled.
* The root key used to create tagging keys must be backed up at a safe location.
* Following link can be used to get more details on DCT.
	* <https://docs.docker.com/engine/security/trust/content_trust/>

## Deployed Containers have Internet Access

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | Information Disclosure | Non-Human-Malicious, Human-Malicious | 3   | 3   | 9   |     |

**Source**: Interviews

**Threat Description**

SmartSite is deployed on Azure Kubernetes Service Cluster. As informed, team can deploy application containers on Kubernetes cluster that can connect to the internet and there are no technical controls in place for preventing the outbound connection. From the use case described by the team, internet connectivity is not required by the application.

**Impact: High**

Without a technical control in place, sensitive data could be leaked to the internet.

**Likelihood: High**

Team mentioned that there is no Egress policy restricting outbound connections and all Pods can access the internet however, there is logging and monitoring performed but not specific to security events, hence likelihood is considered as high.

**Mitigation measures**

* Team should ensure that infrastructure level controls (edge devices) should be configured to ensure that pods cannot communicate to the internet.
* Kubernetes network policies can be implemented to restrict Pods accessing the internet. 
* Team should also monitor the network traffic of its Kubernetes cluster for outbound connections.

## No Egress Filtering

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | Information Disclosure | Non-Human-Malicious, Human-Malicious | 3   | 3   | 9   |     |

**Source**: Interviews

**Threat Description**

SmartSite application and other associated services are hosted containers on the Azure Kubernetes Service Cluster. As informed, teams can deploy application containers on Kubernetes cluster that can connect to the internet and the only compensating controls in place for preventing the outbound connection is the Bosch VNET egress policies(if any). Egress filtering helps reduce the likelihood of unauthorized/malicious traffic leaving the application's networks and can help prevent data leakage during attacks.

**Impact: High**

Without an egress technical control on Kubernetes in place, sensitive data could be leaked to the internet.

**Likelihood: High**

Team mentioned that there is no egress filtering for restricting outbound connections from the Kubernetes cluster to the internet hence likelihood is considered as High.

**Mitigation measures**

* Kubernetes network policies can be implemented to restrict Pods accessing the internet. 
* Team should ensure that infrastructure level controls (edge devices) should be configured to ensure that pods cannot communicate to the internet. If Kubernetes cluster zone does not satisfy that condition, then team should consider hosting the environment in another network segment that does not allow internet access.
* Team should also monitor the network traffic of its Kubernetes cluster for outbound connections.

## Weak Session Management

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | 1   | 3   | 3   |     |

**Source**: Interviews

**Threat Description**

Users can login to the Web or Mobile Application using Bosch CIAM credentials however, they are not logged out after a reasonable period of inactivity. Inactivity timeout periods vary depending on the sensitivity of the data and functionality the application contains, but idle sessions longer than 15-30 minutes are typically considered vulnerable.

**Impact: High**

An attacker's ability to hijack a victim's session increases proportionally with the amount of time an idle user's session remains valid. Once a valid session identifier is obtained, the attacker can impersonate the victim in the application, performing any functionality and accessing any data made available to the victim. 

**Likelihood: Low**

The SmartSite Web and Mobile application is accessible over the Internet however the Admin Web App is only accessible over Bosch(and Partner) network and access is managed using Bosch CIAM. 

**Mitigation measures**

Terminate the user's session server-side after a specified period of inactivity. Determine a session timeout duration that sufficiently protects end-users and the application while maintaining system usability. Session timeouts of 15-30 minutes are frequent for most web applications and vary depending on the sensitivity of the information available during each session. Various standards organizations and government entities also typically recommend organization-defined timeouts or call for an idle timeout of 15-30 minutes

## No 2-factor authentication for Back office Admin Users

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | 1   | 3   | 3   |     |

**Source**: Interviews

**Threat Description**

The SmartSite system has several user roles such as Customer Site Manager, Foreman and Back office admins. The Back office admin users authenticate to the application using single factor authentication mechanism and do not use two-factor authentication. Two-factor authentication is a method of confirming the customers’ identities by using a combination of two different factors, namely something they know (i.e. the password) and something they have (typically, a phone that receives a secret code or voice call). 

**Impact: High**

An attacker who compromises admin user credentials (e.g. weak password or reuse of passwords), can impersonate victims and thus perform privilege actions on the SmartSite system.

**Likelihood: Low**

Attackers will try to authenticate as a back-office admin with a list of known passwords. However, the application has account lockout policy to prevent brute-force attacks.  

**Mitigation measures**

Implement support for a 2FA protocol, such as TOTP or HOTP . Many existing products support these algorithms, including Duo Security and Google Authenticator.

## Insecure Storage of OAuth Access Tokens at Browser

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | 1   | 3   | 3   |     |

**Source**: Interviews

**Threat Description**

The OAuth client stores access tokens insecurely i.e. access tokens are stored in browser session storage. Access and refresh tokens can be stored insecurely in various ways depending on the technology stack making use of OAuth. For Web applications, tokens are stored insecurely if they are stored on the client side. If stored in HTML5 Local storage, they remain available when the session ends unlike when storing them in Session Storage. Storing tokens in web storage can also make them targets for XSS attacks.

**Impact: High**

Storing access and refresh tokens insecurely on a client enables an attacker with access to the client to use them to access the user's resources. 

**Likelihood: Low**

Attacker need access to the client or exploit some other web application vulnerability such as XSS to execute scripts in order access the token stored in browser storage. Additionally, access tokens are valid for only 60 minutes. 

**Mitigation measures**

Keep access tokens in memory and store refresh tokens securely. Tokens should be stored as follows:

* There is no reason to store the access token persistently on the device/server. It could simply be held in memory. If the server needs to store access tokens (e.g. it only issues long-lived access tokens rather than refresh tokens - which is against best practice), then they can be stored the same way as refresh tokens.
* For web applications, use secure storage supported by the used technology stack

## No Root Detection

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | 1   | 2   | 2   |     |

**Source**: Interviews

**Threat Description**

The application does not perform any root detection. Ensuring the integrity of mobile devices is a critical part of enforcing security controls in an application. An application running on a modified/rooted device cannot rely on security controls that are normally provided by the platform. For example, anything stored in the application's sandbox may be exposed to other applications, and all inputs into / outputs from API calls (e.g. for biometric authentication, certificate pinning, etc.) can be monitored and tampered with.

**Impact: Medium**

The Smartsite Android application stores sensitive data such as Access token, Refresh Token and User data encrypted on the device.

**Likelihood: Low**

**Mitigation measures**

Synopsys recommends implementing root detection and warning users of the potential dangers of using rooted devices.

## Certificate Pinning Not Used

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | 1   | 3   | 3   |     |

**Source**: Interviews

**Threat Description**

SmartSite Android mobile application do not use certificate pinning. Certificate pinning is a defense-in-depth control aimed at preventing Man-In-The-Middle (MITM) attacks where an attacker can create valid certificates for a host the application connects to. Mobile applications benefit from introducing certificate pinning as an additional layer of defense against MITM attacks. While normal HTTPS connections without certificate pinning, are typically secure against normal attackers, they are still susceptible to attackers who control a certificate the device already trusts. This situation may arise due to several reasons:

* An attacker may compromise a legitimate Certificate Authority and use it to create malicious certificates. Several well-known Certificate Authorities trusted by all devices, such as Comodo and DigiNotar have been compromised in the past.
* An attacker can trick a user into installing an attacker-controlled certificate.
* Some public Wi-Fi networks ask users to install a certificate before logging on to their network.

Without certificate pinning, attackers who can obtain their own certificates for arbitrary websites from Certificate Authorities trusted by the device can perform MITM attacks on otherwise secure HTTPS network connections. Such attackers can eavesdrop or alter all communications of the mobile application, which may include sensitive information such as credentials and payment details.

**Impact: High**

An attacker can access user’s credentials and view/intercept/modify their communication with the server. This may result in information disclosure and financial fraud.

**Likelihood: Low**

An attacker must be able to generate a valid certificate or convince the user to install a Certificate Authority (CA) on the user’s device. The attacker must be located in a suitable position on the network to be able to intercept devices’ communication and serve the fake server.

**Mitigation measures**

Mobile applications can use certificate pinning as an additional layer of security to verify that the certificate presented by the web service is the one the developers expect. Certificate pinning allows mobile applications to have fine-grained control over the certificates they trust. As mobile applications typically only exchange sensitive information with their own web services, the certificates chains of those services are well known during development and can be hardcoded into the application.

Certificate pinning can be implemented on Android via third party libraries such as OkHttp and TrustKit for Android. The Android operating system also supports certificate pinning natively via the Network Security Policy capability, for devices with Android 7 and later.

# Process-Based Risks

## Missing IT security responsible

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | All Threat Classes | Human-Malicious | 3   | 3   | 9   |     |

**Source**: Interviews

**Threat Description**

There is no dedicated or central person to be responsible for IT security. Although security should be a shared matter and everybody’s contribution, there should be a stakeholder that actively pushes the platform security controls and monitors the progress in addition to the security requirements imposed by compliance. We observed that only partial aspects such as data protection and secure design have been considered from the beginning, however other security initiatives such as secure code review, security testing and risk analysis have not been performed yet or are not followed consistently. Moreover, if there is no overarching IT security responsible or IT security volunteer within the project team, then security requirements might not be defined sufficiently or fulfilled correctly. This could have high security consequences when security defects are detected shortly before going live or after that.

**Impact: High**

Lack of responsibility for IT security (aligned with business risks) can lead to surprising security risks, defects and lengthy remediations that can both impact the business. 

**Likelihood: High**

Without a consistent effort to mitigate the agreed security risks, security issues may appear.

**Mitigation measures**

Clearly define the team and personnel responsibilities in the entire platform lifecycle and appoint a stakeholder (existing team member or a new team member) who would be organizationally responsible for defining security requirements in the beginning and then overseeing their implementation. In smaller teams, this role could be shared by senior technical members such as architect/lead developer, and the product owner from the business side and project security manager from the information security side.

Particularly for agile developing teams, implement the approach of considering security from the very beginning of the product lifecycle. Security should be everybody’s responsibility and therefore everybody needs to have a sound security awareness level coupled with technical IT security knowledge for the technical staff.

## No Secure Coding standards being followed

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     | Tampering | Human-non-malicious, Hu-man Malicious | 1   | 2   | 2   |     |

**Source**: Interviews

**Threat Description**

The SmartSite system is composed of various sub-components using different technology and deployed in Kubernetes i.e. Fronted is written in Angular, Android Mobile application written in Kotlin, backend services are written in Java SpringBoot. The development team indicated that it does not currently follow any secure coding standards created by Bosch for building secure software or for preventing common vulnerabilities.

**Impact: Medium**

Not following secure coding guidelines could introduce security vulnerabilities in the code.

**Likelihood: Low**

The likelihood is considered low as the team is using a SAST tools to identify security issues within the code.

**Mitigation measures**

Create and enforce secure coding standards to reduce the likelihood of common implementation errors.

The team should aim at following any relevant secure coding guidelines available in Bosch for various technologies that SmartsSite is using i.e. Angular, Kotlin, Java. 

## Entitlements are not actively reviewed

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | 2   | 3   | 6   |     |

**Source**: Interviews

**Threat Description**

SmartSite utilizes various Azure resources like Data Stores(MySQL, Cosmos), Azure Kubernetes Service, Azure Key Vault. The application team have access to all of these resources. In addition to that the back office admins can promote application users to admins of the system for testing or debugging purposes. However, these entitlements are not actively reviewed on a periodic basis.  Although, users have to provide their Bosch AD creds to access these resources there is no monitoring to verify if a user actually needs access to these various resources and functionalities. 

**Impact: High**

No review of entitlements, in addition to lack of principle of least privilege can lead to unauthorized exposure of sensitive data.

**Likelihood: Medium**

There is no formal review process to check and verify how many users have access to the various resources and whether these users actually need access to these resources for performing their day to day activities. Additionally, there is no separation of access levels i.e. all the users who can access the Azure Key Vault have same level of privileges. Internal users can access production resources.

**Mitigation measures**

The access to all the resources must be actively reviewed on a periodic basis. Users access should be removed if they no longer require access to a resource to perform their day to day activities or dont have a business need. 

## Application Secrets and Keys Are Not Rotated

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     |     |     |     | 2   |     |     |     |

**Source**: Interviews

**Threat Description**

The SmartSite system does not have a policy that dictates how often application secrets, certificates and keys are to be changed. All the application secrets and keys are stored in Azure Key Vault. Even though the credentials are securely managed, no procedure is in place to periodically rotate them or change them in case of compromise. In time, all secrets are susceptible to disclosure and it is important to have a policy in place and followed that mandates how often production keys and passwords are to be rotated.

**Impact: Varies**

The impact depends on the keys or secrets that were compromised. Worst case, an attacker is able to access all assets handled by SmartSite system.

**Likelihood: Medium**

An attacker is able to use compromised keys and secrets as long as they have not been revoked. A relatively small number of staff have access to these secrets.

**Mitigation measures**

NIST publishes standards that organizations can follow that dictated when encryption keys and passwords should be changed. The relevant standards are:

1. NIST 800-57 for encryption key expiration
2. NIST 800-63 for passwords

## No Segregation of Privileges

| Assets ID | Assets | Threat Class | Threat Source | Likelihood | Impact | Severity | Threat Id |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     | All Assets | Elevation-of-privileges | Human-Malicious | 2   | 3   | 6   |     |

**Source**: Interviews

**Threat Description**

As SmartSite team size is small, hence the responsibilities are not granularly distributed, and neither is the access privileges. All the developers in the team have access to Kubernetes namespace, Azure Key Vault and data sources.

**Impact: High**

One malicious insider could compromise the entire infrastructure rendering the SmartSite applications unresponsive.

**Likelihood: Medium**

Only a SmartSite personnel who is part of the development team can exploit this vulnerability.

**Mitigation measures**

Best practice is to implement the principle of segregation of duties - persons in the development environment do not have any or not complete access to the production environment. Since this is not easily practicable in small teams and agile environments, it is recommended to consider the following:

* Have only a subset of developer with permanent access to production and grant additional access based on demand.
* Log and monitor privileged operations on the databases and servers.
* Archive metadata about each deployment including who started it.
* Remove (permanent) developer access to Azure Key Vault with business sensitive technical information such as database credentials and credentials to access the Kubernetes.

# CI-Team Related Risks.
