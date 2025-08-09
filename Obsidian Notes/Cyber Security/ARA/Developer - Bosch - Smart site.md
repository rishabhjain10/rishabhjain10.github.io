# Developer - Bosch - Smart site

LEAN collab platform

Daniel oliveria - mobile android team
Danil rodrigues - Frontend developers
Lars - lead architect
Peter Kleimann - Novatec - infrastucture and ci/cd pipeline, cloud services etc
Christian - senior s/w eng working on backend

**Where is the code hosted and how is the access to it managed?**
Azure devops - certificates to access and everyone has key. Each microservice has its own repo and deployment pipeline
All dev can see all repo on azure

Any input validations?
types of the file(jpeg, png, gif) zip files are not allowed, 5MB or 10 MB max , lengths are checked. client and server side validations

**Input Validation and Output**
Relying on the AngularJS but not doing any output encoding. Only accessible over HTTPS?

**Security header in place**
Follow-up - Backlog ticket for csp policy

Any protection for CSRF attack? follow up

**Authentication**
migrating from implicit to PKCE - in past save tokens with local storage now doing it to session storage. Access token has 1 hr and does silent refresh when 401 error or after 45 mins.

Is the auth code tied to the client?
Can the auth code be reused or one time use?
Is the auth code tied to a client? yes
sample JWT token?
The token has email ID only
Auth has redirect urls - are the whitelist provided to the CIAM and configured - yes

**Mobile app** - how are token stored
Stored in shared prefs - encrypted - AES 256 key is stored in android key store
Store all info for offline mode - stored in sqllite db - the db is encrypted using sql cipher - where is the password stored - encrypted in shared pref
No fingerprint or bio metric authentication
Any protection on android binary? - not aware of any protections
Used java but all kotlin now

Does the app write any logs - no logs related to authentication - follow-up?
API version - 23 (min)
Does it allow backups? no set it to false
Does it allow debug? some debug on build config/gradle
Does the app use any webview - to display licenses - is the user data pushed to this view? -no

Admins can create, delete, promote to admin, creation of admin , assigning users to companies

Admins cannot add users to a project - the project owners have to invite them

Tech stack
Web - AngularJS (v10), typescript, CSS moment and lodash
2FA to view the azure devops code repo, SSH/cert based authentication

Development lifecycle
refinement meeting with dev for requirements - add it to project backlog then to sprint backlog - combined planning - devops scan (sonarqube) - manual review -automated test acceptance runs - QA checks - deployment and prod planning

Any security coding standards? spotbugs or findbugs but not documented yet?

Environment - dev then to test stage (end to end stage) - review - prod

Who can provide prod level access - every key member has access to key vault.
Key vault is accessible over novatect and bosch n/w

K8s cluster is secured by AD creds.

How is routing work?
Spring cloud gateway has all the routing deatils to which services will received the request

5 worker loads are in same region? multi-zone deployment

Operator in the diagram are developers

Promethus (runs on all environment?) and grafana are deployed seperately? - dint get it

using default name space (for all the services, users, projects) and monitoring name spaces in k8s  - Anchor/ankle scans for images in azure trust registry

Are the images signed? they are not signed currently but might happen in couple of months

base docker images are google repo

can all services has access to k8s api? every service has it own service account to access k8s apis

Do all pods have ssh access - services running inside the cluster

k8s version (117) and mysql db versions?

Any runtime monitoring for pods running in cluster

slack and email notifications if the deployments fail

session is valid till jwt is valid

Are access to mysql, kubernetes logged somewhere?  azure log analytics

Backups?
we have some db backups provided by azure - how freq?
kafka data is replicated and then switch to other clusters if failed

in future, have backup for application db

Have you tested the recovery from backups?
we tried it once but not frequently

How often the creds are rotated?
No automatic process but the backlog has it in plan to implement
azure service priciplals need to rotate after 1 years and certs after 2 yrs

do we review entitlements or access in prod regularly? - dont know

Azure update mechanisms used for patch managements

How are third-party libraries included in the app? - no restrictions from public - some shared services are stored in azure devops repo

Are there any scan on open src lib? - backend uses owasp dependency checks, also uses npm audit
