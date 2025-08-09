# Lead System Architect - Bosch

Attendees - Lars Dülfer [(lars.duelfer@novatec-gmbh.de](mailto:(lars.duelfer@novatec-gmbh.de))

Understand the system from your point of view

Benjamin - perform risk analysis, threat model, overview of the stuff, is devops guy and doesnt code.

Lars - novatec
C@- part of team from inception - overlook entire architecture, backend infra, works with team weekly

Lean collab platform work with workers on construction site in lean method. jira for construction site

Construction site manager - one or many - create project, add or change employee
company rep
foreman

Roles
employee role
prohject role

use android app used by foreman

admin UI availablke over public and bosch nw only and 4-5 users
self registration? - no, external CIAM is used and get bosch ID then registration then redirected to bosch system then link the data from CIAM with scope and authenticate user in backend - oauth with CIAM

CIAM holds only creds, smart site stores all the user profile info - Azure db for mysql - every change is sent as event in kafka and written to changelog

After initial setup, ask user for additional properties

userservice - signup process, registration with CIAM with bosch global ID, then user is assigned a company done by admin, cannot assign it themselves (company service, admin interaction/approval required) and start working and used in construction project.

User has role inside company inside project and can be construction manager and add other people

Smart web ui uses openid connect over https

Oauth - proof key authentication flow in a week (PKCE flow) - same for android app - at the moment implicit flow

Is there IOS app? no only android app for now

after registration, signin page - give creds and then redirects to bosch home page

email sued to register cna be on any domain

user after registration can be applied a employee role but still needs invite from company (anyone from the company can invite)

construction manager can invite from any company into the project

Lean calendar - users can create task, some sort of work done over weeks, create day card (work done daily basis) - day card is approved or completed at the end of day.

For every task, you add details like start communication like what was completed or not completed, upload pic etc, need for action, can assign the day card to any user and start communicating, activity log can be seen by anybody. day cards are part of a task

editing or starting task can be done by constrcut manager but discussiona nd other can be done by foreman

day cards can be approved by CSM only

Can export teh card/task data in pdf, json,csv format - anyone can do this

Validations for user input or forms - firewall is used, spring boot validations are relied on - user prepared stmts for sql and not dynamic. no native sql is constructed.

No financial data on the project

No change password and forgot password - done by CIAM

Any login controls? lock out etc? - dont know

JWT toke is used in Oauth from CIM -

samrt sitre all services have public key of CIM and validate the token with pub key and then unpack the token and CIM ID in the token is compared with in the application/user identifier. The pub keyc an be retrieved dynamically if needed. The pub key is stored in memory. Token in valid for an hour and use refresh tokens (debateable).

What claims are being used in token? - None

authz happens on data inside the app only. authorization are in business logic for every srvice. Service does the uathn/z checks, thats why the data is replicated across services

majorly - user, comapny project services and the rest are secondary and dervice data from these services

Mobile application - only android app
any android binary protections? onfuscation, store some offline data dn is encrypted - but better explained by mobile developers

Data protection - at rest and at transit

At rest data is encrypted and they key is provided by azure for the db. The entire db is encrypted. same with kafka.

Do all db have their own encryption key? yes
Where are the keys stored - they are provided by azure and we dont have accesss to the keys
every db request is ent with username/password (diff for diff db) and then azure decrypts it (transparent to the service or bosch)

Encryption algo - dont know

How are connection string protected? user services run in container via k8s and connection string are avaialble in vault and kubernetes wull fetch it from azure keyvault? ------------> question/clarification

Kafka event data is encrypted with API key/secret (stored in azure key vault) and also use ACL to restrict operation and topics

admin wants to update creds for kafka or db, use azure portal or scripts to change the vault values. done by key vault

azure gateway is where ssl is terminated. servcie to db is again encrypted

Log management

All the service/application or kubernetes logs uses fluentid and the aggregated/stored in splunk

Application gateway/WAF is specific to samrt site. Logs are monitored

Deployment structure

USe k8s to deploy. All services run in their own pod. azure dev ops has its own pipeline for each services, azure container registry

terraform is used - deploy helm chart and deploy it to k8s. As soon as there is change then azure pushes that to k8s

The base image? - distroless image from google.
Any restrictions on base image - no restrictions but by convention

docker trust registry??? why is it not bein used. Any image form docker hub may contain malicious code so having docker trust registry is good idea

\*\*\* do we always have ppl show the screen?

k8s cluster is dedicated to smart site
how many worker loads? - 5 nodes maybe

k8s api and how is that protected?  every developer can access tied to azure creds? also use 2FA with call to phone

20 ppl working on the project

role based access on the k8s api server? no fine grain controls

protections on XCD on master node, etcd, AKS node? we dont have access to master node and accessible thru azure API. we only control child nodes

have any POD security controls? only one service talk to each other and use n/w policy. but no controls inside the cluster but no "calico" within cluster.

What keeps you up at night?
How often data is replicated and disaster recovery
implicit oauth grant, storing creds on mobile
kafka and all the resources are shared and no roles based access

Anything we might have missed
data integrity
data exposure

around 1300 users
