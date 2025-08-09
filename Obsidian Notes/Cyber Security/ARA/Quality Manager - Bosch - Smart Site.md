# Quality Manager - Bosch - Smart Site

Axel - Quality manager, agile test manager

Performs unit testing JUNIT, SAST (Sonar qube, included in CI pipeline and the integration fails if any findings) and code review

code review and Unit tests written and reviewed by dev
User story review is done by Axel.
Practical and regression test. (quality issues)
Pentest are external issues and for the change in auth to PKCE.

When does a build is broken?
either sast or manual review is used based on user story to break the build

OWASP rules are included in sonar qube but no source code review from security perspective.

Stages of environments - dev, test, review and production. QA has access to all environment (also has access to prod environment, every body can access prod accounts with Bosch CM account, someone from Bosch activates the user and then they can access prod environment)
Send an email to request access and the team will grant access to prod using separate application account.

The prod data is used in hospital project and is anonymized and masked.

How are the environment seperated? Four subscription provided by azure - every environments have their own clusters

Any negative test? There is a positive and negative end-end test

Only one person in the QA team

Prod access is application level access and needs invitation to project (test project etc). No backend/server level access.

Container base images are scanned around the clock.
