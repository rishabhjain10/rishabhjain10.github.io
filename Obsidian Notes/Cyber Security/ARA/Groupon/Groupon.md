
```table-of-contents
title: 
style: nestedList # TOC style (nestedList|nestedOrderedList|inlineFirstLevel)
minLevel: 0 # Include headings from the specified level
maxLevel: 0 # Include headings up to the specified level
include: 
exclude: 
includeLinks: true # Make headings clickable
hideWhenEmpty: false # Hide TOC if no headings are found
debugInConsole: false # Print debug info in Obsidian console
```

## **Report**
![[Groupon Threat Model Report FINAL.pdf]]

## **Security Architecture Design**

### **Spiel or Introductions**

* Hi **speaker**
* **Interviewers** are tasked to perform a secure architecture review on **in-scope systems**
* **Name and title intro**
* As part of this assessment, we sit together with different technologist and understand how the technology fits in and get different perspective of the system.
* During our conversation, we look out for different assets that we are trying to protect, security controls in place, different attack surfaces and potential threat actor and where they might sit in the environment.
* After this we build an architecture diagram and present the report to Ben with our findings like where are the architectural flaws/risks and these will help Ben plan for different program and budget them.
* These are more strategic findings and are not like bugs that a developer can fix in 30, 60, 90 days.
* Lastly, this is not an Audit, we are not auditors, we don't have a standard we are testing against or any questionnaire. We gather data based on conversation. We ask different questions and to tailor the conversation for you, we like ask if you can tell us about your current role and what falls under your purview?

* * *

**Rough work**
assets and controls and attacker type
remediations or recommendations we talked about
tech research topics - like AWS or kubernetes

designing distributed systems book

* * *

**Ben Lawson**
Introduction to groupon system:

* Defacto architect, 2006
* Groupon is microservices based plaform - 700 services - autonomous - No cross service knowledge ()
* initially monoloithic PWA(primary web app)  - (used a data stororage and used to sync data - exposed to other services)and still exists
* API proxy exposed externally and internally. (Home grown like APIGEE but doesnt have much security - client ID is a secret and doesnt not track that - basically a flaw)
* Client ID is in URL and tied to a particular app
* security token in the HTTP - Long lived self described tokens - JWT /what what the actual thing????

surprising service

* Token signing services for integration with partners for verifying some data from partners - not publicly exposed
* Add cart, add billing, email subscriptions, logins/api
* Consumers - buy something on groupon, merchant - we will sell soemthing on groupon
* Seperated login endpoints for merchant API and web app
* currently an account can be both merchant and consumer
* ACHs information on merchant???
* credit card validation - very rudimentary like is card valid or not thats it
* No password complexity at all maybe
* Assets -
	* credit card,
	* ACHs,
	* mass email addresses,
	* checkout - generate  account creation to exhaust the subscription and sell the account,
	* password resets
	* add credit card to billing so validate credit card
	* email activation

WAF anything that is public www, API based on OWASP - use geoblocking
computationsally intensive services from $ perspective
custom waf rules - accidentally credit card in response

PCI and non-PCI - [www.group.com](http://www.group.com) - akamai with CDN - origin (on prem or AWS mostly) - waf - sensitive service will go to PCI infrastructure

AWS procy layer - hyper boundary - envoy based proxy - layer7 routing - does the service live onprem or AWS - validates if the traffic is coming from akamai - mutualTLS from service to service -

internalPKI - self signed by groupon for AKAmai and akamai trsuts the certs - maybe a flaw????

route key is offline air gap online on usb drives are encrypted in encrypted to sign 4 intermediatory - 2 in AWS - no one has acces to it and 2 ppl needed to access it - touched it twice in thrice - to setup CA's in AWS

passwordstate for deadbolt solution

layer 3 and 4 DDoS protection - prolaxic dbs akamai

\*\*\*self describing longer tokens - for public disclosure - 90% were - we dont maintain session on our side - logging out of token is destroying token on client side.

hyper boundary sits infront of API proxy

ModSecurity -- XX -  is AKAmai
no onprem - app firewalls

Sigmasigns -
Juniper - egress filtering - hosts making outbound connections will need to be whitelisted same with email

* * *

**Brian Ewins**

Services are in one large kubernetes
Node accees is controlled - formin?
Over permissioned
Break glass permissions
probably a dozen have same permissions

Logs - logs of grants that were done and secure log of all the server to logging system like SSH to servers, audit log of kubernetes

Long domain NLB - redirects to OKTA

* * *

Shyam Mankala
principal engineer

client ID is needed at API proxy and used for thresold or other purposes and are tied to version of the groupon

Login - Oauth token valid for one year

message bus - subscriber and provider basically a broker

c1 - password
c2 - can identify user

RRRR
Secondary login
get token refresh

* * *

Kevin Sharp
Hybrid boundary - envoy open proxy - akamai - proxy - domain/path we direct to correct place

akamai and piblic name space

VPN users can talk to internal services using okta for authenticating the services.

mTLS sidecar - kubernetes and

Out of scope (SSO not in scope for tests) story and VPN removal (all encryoted and fine till VPN but once stripped it all vulnerabilities) story from mike

* * *

Owns the services that do authentication
user service - authentication - identity and authentications are being broken into two things - dont do any autorization - password auth, apple, google signin - tokens for pw reset for nonces

Doorman - service used to auth internal users - gives user sevice token - internal AD setup (SAML and okta) - validate that account exists

USer token - It is a JWT - and will be JWT soon - self describing - what ac belongs to, do they use pw auth or fb - long lived (no refresh tokens) - tells when the token was created - lives for an year - no actual expiration

No secondary authentication

Recomendation - Follow OWASP JWT cheatsheet  RRRR

* * *

manager of security - migrate to AWS from security POV - PCI environment to AWS - AWS landing zone and PCI envi - have different okta org

proper controls on AWS landing zone - security controls in terraform - config service at org level - entire inventory at one single place/console -
AWS native  - gaurd duty and deployed as security and member accounts - gaurd duty from strategic to security.

telematry to siderous?? collects log froms AWS/GCP to siderous in chronical and used to corelate data and alerts on security issues

lift and shift or cloud native application

Lot of open source tools - reimplements - [groupon.okta.com](http://groupon.okta.com) - [groupon-pci.okta.com](http://groupon-pci.okta.com) but tied to same AD

creating new service then how is it born in AWS - standard document we follow - knuckles are stateless

we use secret manager running ins ec account, roles in other acount from our secret manager and under namespace

storing secrets in github??

* * *

elliot moore

Client service excelence - legacy account in AWS and AWS landing zone -

one user can login and make changes to 25 account after auth once. need two AD accounts

Permission with most permission group have more access to stuff

ARQ can be review for when a particular permission was used? - can ask alexander

* * *

Ryan Ogden - how merchants and consumers interact

vuln managerment is at service level - tenable - runs across nodes, datacenter and monthly basis. - unauthenticated scans

C1-C5 systems and mTLS due to GDPR - dont do authenticated scans as its too false positive - we dont have scans that can do service to service.

There is not base image or golden image to make sure that images are using latest version
Dont have a full invenroty - hope there is spreadsheet which has all lib/images uptodate
will start to do SAST - sonarqube - intentions to get rid of crappy libraries - run time protections later -  Ruby mostly (breakman) and checkmarx (cheap)

internal program to do SAST - people who wrote it left and no maintenance - so no standard pipeline (RRRR) - no one took charge and died up

* * *

principal engineer - card link offers - third party integration and booking - health and wellness - partner distributtion

connection to visa/amex and master  -- consent credit cards in our system - and part of plus program - to register those cards - ssh key rotations - once we connect to system - card acceptor ids and register with providers - merchant is part of network and get notification when customer does a transaction and cash back -

voucher    - more ppl using groupon and dont need to be part of GO - partner with banks and have groupon offers there - we have connection with providers like amer and give them merchant UUID and offers so they will able to tell like actions that happened and cust have consented.  - similar for loyality points - loyality points can be used to purchase GO - GO guest checkout - partner sends the email and UUID for redemption purpuses

API where we go get all third party/partner offers - for like live tours and live events - might need email/phno

SFTP and API to transaction????? - shared secret and TLS -  over ssl/tls - install ssl certificate by the partners - ssl rotations and ssl resigning with repos and also sign scertificates.

pain points - we have github repos to store secrets and certs - partner certs are installed on detokenizers but dont know how they are stored or where

mergebot to install??? - only allows to merge if two ppl approve it other than requester

deploybot??? - we require secret repo as sub-module - reads secrets into kubernetes environment variable in secret management by kuber

Github private repo

Admin and repo can look into anything like secrets FFFF

if two containers are in same projects then they both have same/shares secrest even if they dont use all

old central pw system was single point of failure   

tokenizer and detoken

* * *

Kalyan venu gopal
Principal engineer

consumer platform for merchant and consumer - entire application platform - API interacts with different services
More homegrown solutions????? good or bad????/

behavioural modeling - user misbehaving - rate limiting is performed at groupon API/GAPI

j-tier - backend api and caching and apis and java framework

* * *

alexandru - cloud core team - cloud center of excellence for groupon - AWS environment and recently GCP env - look best practise and build tool fro the same

s/w engineer with devops - bit of coding and designing - stakeholder for design doc for cloud migration, kubernetes - cloud core helps with first usecases and best practices before deployment

Not much visibility into kubernetes

we dockerize it and move it to kubernetes for most cases - avoid lift and shift for EC2

kubernetes is run by conveyor team

seperate AWS for kubernetes and AWS EC2 for mail etc

if they use EC2 then into different account
for storage - if moving to kubernetes then not require persistent storage then if needed give db in cloud by GBS team and issues RDS on request
sometimes kubernetes and then use S3 for storing files

We have ADM (arch design and meetings?) if they dont have known patterns then we have ADM with details with stakeholders and others
No approval needed but need to document design considerations and what the exception is

apps running on kuber store secrets like db or 3pip - we provision IAM users and access key and access secret - kuber has secret vault and runs on kubernetes I guess - earlier used github with access controls

When we create secret it is encrypted with GPG keys in terraform and provide requestor the encrypted blob.
The key is not roatated for IAM user for the above

r db access, apps on kuber - try to replicated what we do on onprem - pwbased auth - dont have visibility on roatatoon and could be static creds

dedicated db team and platform team both reside on same account - we granted more access to teams for faster developemnts. But some IAM users are permissive

Try to implements for new teams, we dont deny console access for dev on production?????? RRRR

3 bad thing can happen with console access:

* No way to peer review from the team - operational risk - they can db access and snapshots

AWS config and cloud trails to track what happened after the fact

db or service level pw are stored in secret store type in kubernetes platform
secrets inject in kubernets env variables

from db perspective takes backup which are in same account in prod - there is proj to use aws account other than the db account itself

backup push based or pull based - does the prod talk to backup or vice versa?????

* * *

Michael Contino - vulnerability management program - got some tools setup and wrote some policies and procedures - More DevOps focused - terraform infra as code - container/kubernetes environment - improve what is getting next deployed.

Adding more appsec components??? - do a lot of incident response lately? - try to do automation with teams and do like pipeline work

Tooling for vuln management - [tenable.io](http://tenable.io) or nessus - on prem db scanners every months and external every month
Tickenting system for bug tracking? - 4 ppl/engineers used to traige faraday tool more of pentest IDE. use tenable for vuln management.

We have two issues -1) there is no time on plate to dig through data and prioritize vulns 2) 90% of vulnerability data is on prem and will be gone by Q2  RRRR

How often we deploy things? - some ppl deploy on a sprint 2-3 weeks like active/resourced teams, others some ppl deploy 2-3 times a year.

How involved were you in log4j - still ongoing, I was involved as tech lead on that - we had few challenges - we dint have good idea of scope - j-tier is all maven with java app (core framework) (big ones and high evffected) and i-tier - node/java/ruby on rails 4. Some don't formally document services and with that looks like we were handful of affected and had to github repo searches and then talk to ownership and involved lot of manual work.  RRRR

Already looking at tooling and things - is this repo being deployed? - MVN dependency and some lib are not being used or used only on dev. Took lots of ppls time. Slow remediation process bcoz - technical ownership and resources team not taking it seriously sort of cultural thing!! RRRR

app dependency tracking system - SCA - OWASP dependecy track - check maybe? Generated bill of materials - list of metadata of application and dependencies - Insert into CI/CD pipeline RRRR - tells what is active and also establish ownership as someone requested a build

We do a logging infrastrcuture for service deployments with kuber running ins AWS and EKS - we deploy sidecar containers and sends logs to ELK cluster. Containers are updated quarterly. Tools will find issues in sidecar containers and make everything vulnerable. Take very long time to identity/fix it. Different ways and version to sidecar

Kuber cluster we actually have job 6 hrs and gets metadata for kuber API, pull containers from cluster and app dependency from kuber and some metrics for whats in prod. Have data but taking action without cultural shock or friction. No build fail becoz of it but we get metrics.

AWS resource provisioned via terraform by Michael and cloud engineering team. base infra and kuber/EKS cluster known as formerly conveyor.

Incase ppl aren't containerising and using EC2 and 2yrs ago - we do all patching, security log from it, wazuh agent (OSsec (sys logs and file) + logging irregularities). Tenable IO on AMIs too (backing out to save money and resource cost)  - sort of like golden image with hardening - team shud use by default and is not enforced????? and they document any exceptions

systemic issues
versioning of core tooling is lacking and some chose not to use that. Migrated and whatever version worked and dont wanna change that. So more complex and harder for us to fix this issue.

Ownership documentation is lacking - There is not force on when and how and that shud be used - Some services that had log4j was well documents and some workers were not well documented and unowned those small pieces

credential and secret management is pain - private gitub repo to manage prod credentials, as its highly automatable they are adapted. Some ppl have taken repos when they ahve left company and cost tons of money and engineering time . Some leaking creds and able to put fix but some ppl not suing the tools. RRRR. Thinking to deploy Hashicorp vaults (really really expensive as how its priced and have a dedicated engineer and build tooling about it) or secrets manager (cheaper and some automation already in place)

deadbolt is longterm password storage/generator??

currently secrets/key are not being rotated unless requested- usually compliance driven like some leaves company

* * *

James Ciamaga - manage PCI environment - refer PROD as not PCI

user access, approvals, PCI audits, infra - data include credit cards, authentication data

tokenisation and de-token - we have system in-house tokenizer written in ruby - lives in physical datacenter and moving it to cloud. we keep last four digits as we need them for processing

We dont pass the pin to any other local service but we directly send the detokenzied data. Only used for payment gateway. Fraud team doesnt see the full pin only the last four digits. operation risk????

New QSA - Shak amigi

Billing, card link offers, fraud, payment processing  go into PCI

100% on moving all tokenizer and de-token to cloud by Q2 in production

credit cards, encryption keys and certs are the only information we store AAAA

* * *

**Samuel Fox**
Run change management team - two team  deploy management group - prodcap has logbook and jira and req are made to prod - scan tickets and scan service risk. Approve or deny service requests

Jarvis which is slackbot on will framework - work on slack and pull into slack - service owner pull down all jira tickets by a team and assigned to us and on call details

Standard on mortaorim and change policy and how thresold tests are done and what team should be doing it.

ORR?? - runbooks like do they have monitoring setup and does AWS have so on so with 40 checks and determine if they pose any risk.

Currently not all services follow the above process. if service exists out side of service portal and anything business related is not under the scope

With migration to AWS, anything moving to AWS is tagged with service tag and reg with search portal ID. ORR team has 3 ppl and deploy mgmt is 5 ppl

evrything is divided into core (imapacts business or network) or non-core()

Auto-security compliance check - external check, sec reqs from the service owner/team
policy checks on conveyor cloud - certtificates
check for plain text password in repos

In-house tool to do vuln finds but is sunsetted and reported to ORR.

Exception in signoff only when emergency with sev 1 or sev 2 and loss of business.

Exception are given often on holiday times with VP approval during moratorium.  (code freeze and no deployment to production during holidays or load test)

tech on which we build - JAVA then I am worried about desserialization etc
tech for which we build - like browser - XSS is common,

* * *

* most tokenization - 16digit CC - token should fit into 16 digit - no design constraints
* Groupon shrunk - asset management and business continuty ileft company and no one does that
* Read ADM and backup and restore stuff - Not upto mark and doesnt make sense
* RRRR - Make someone responsible for appsec
* Diagram - merchants and customers , business partners -  - no infrastructre in diagram - expand akamai layer - akamai protects but need to represent that - someone from akamai can be attacker
* Too Dependent on akamai to segregate API so that all ppl cannot access all APIs (mobile/client/desktop browser versions)

Nothing is enforced or too service owner dependent not driven by security???? RRRR
Console access for dev on production??? RRRR

cloud component
web container
AI - LLM provider!! opensource or openai model for security considerations!!


* Absense of BC/DR director
* Github secrets management to Hashicorp or secrets manager
* security tokens to JWT - already in process but call this out
* Mass fake accounts creation and consuming offers and then selling it online attack
* Combine backup 4 and 5 strategies
* Have someone responsible for appsec program

Loose IAM permissions
global bugs no orchestrations
solutions for secret managent and ssl certs and rotation

* * *

Consumer fraud - reason code that indicates fraud - charge back - Not meeting requirement
Reg fraud - stolen CC not auth by a/c holder
Friendly fraud - they buy and they dint receive it even though they did it -

Lift firewall to allow go to facebook so sales can go to boa.

* * *

* * *

Social media rep in diagram - managed risk like fraud protection
IOvation - device fingerprinting - partial control
s/w bill of materials- centralised capability for s/w - pub/sub model with security product - operational risk
Geoblocking - for controls - No business from latin america if we dont do business there

draft writeups - system description of groupon production system -

Finding writeups -- Risahbh Jain \*\*\*\*

Access controls and repo are the same github repo

Talk about sonarqube so that they dont repudiate and changed observed from writeup to notice or heard etc

secure coding guidelines, defect discovery and metric or dashboard in risk details

**Brainstorm session**
credential management is an issue
hybrid boundary as controls
hybrid boundary in tracebility matrix
mtls - bidirection auth, encryption in transit(C and I), authorization by hybrid boundary
input validation sure but service to service communication.
output encoding happens at the edge
Akamai will take out any malicious stuff and scrubs CC numbers at the edge
Ben is worried about inside stuff not edge stuff
Heard about logging a lot - ELK cluster - audit logs too
Has off the grid PKI
Twistlock for container image scanning - control
Using terraform script to standardise the container infra
No governance for clean sonarqube scans
deploybot auditing prevents operational risk and

semi managed - attacker is insider threat / compro devops - cust and merchant data - AS - deployment groupon software - backdoor/data exfil, ransomeware - risk - medium - residual risk is low -

mtls and HB - protecting from internal attacker trying to access APIs directly - can go into managed risk section of report
