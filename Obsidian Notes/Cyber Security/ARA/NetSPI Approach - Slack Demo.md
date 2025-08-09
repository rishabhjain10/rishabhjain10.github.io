# NetSPI Approach - Slack Demo

**TM Folders**

* Artifacts
* Deliverable
* Managements - sop scoping, kickoff
* Work

**TM Tools**

* GIMP or photoshop
* paintbrush
* Visio

**Business Goals**
Slack is a channel-based messaging platform to align their teams, unify their systems, and drive their businesses forward. It is a new layer of the business technology stack where people can work together more effectively, connect all their other software tools and services, and find the information they need to do their best work. Slack is where work happens.

Slack's Key services/functionalities:

* Messaging and Channels
* Integration
* Shared channels (slack connect)
* Search

**Business Risks - Risks Related to Information Technology, Intellectual Property, and Data Security and Privacy**

* Real or perceived errors, failures, vulnerabilities, or bugs in Slack could harm our business, results of operations, and financial condition.
	* Basically vulnerabilities in new features, deployment or integrations etc can result in negative publicity, loss or leaking of personal data and data of organizations on Slack, regulatory fines and loss of business
* If there are interruptions or performance problems associated with the technology or infrastructure used to provide Slack, organizations on Slack may experience service outages, other organizations may be reluctant to adopt Slack, and our reputation could be harmed.
	* Due to Infra changes, new functionality, human/sw error, DOS and ransomware attacks
	* We depend on services from various third parties to maintain our infrastructure, including AWS
* A security incident may allow unauthorized access to our systems, networks, or data or the data of organizations on Slack, harm our reputation, create additional liability, and harm our financial results.
	* Slack may also disclose or lose control of their API keys, secrets, or passwords, or use the same or similar secrets or passwords on third parties’ systems, which could lead to unauthorized access to their accounts and data within Slack
	* Despite significant efforts to create security barriers to such threats, it is virtually impossible for us to entirely mitigate these risks, especially where they are attributable to the behavior of independent third parties beyond our control.
* Any actual or perceived failure by us to comply with privacy, data protection, information security, consumer privacy, data residency, or telecommunications laws, regulations, government access requests, and obligations in one or multiple jurisdictions
	* CCPA, GDPR, HIPAA
* Interruptions or delays in the services provided by third-party data centers or Internet service providers could impair Slack and our business could suffer.
	* Our operations depend on protecting the virtual cloud infrastructure hosted in AWS by maintaining its configuration, architecture, and interconnection
	* Although we have disaster recovery plans that utilize multiple AWS locations, the data centers that we use are vulnerable to damage or interruption from human error, intentional bad acts, earthquakes, floods, fires, severe storms, war, terrorist attacks, power losses, hardware failures, systems failures, telecommunications failures
* If we fail to adequately protect our proprietary rights, our competitive position could be impaired and we may lose valuable assets, generate reduced revenue, and incur costly litigation to protect our rights.
* We use open source software, which could negatively affect our ability to offer Slack and subject us to litigation or other actions.

**System components**

* Slack is hosted on AWS data centers
* <https://aws.amazon.com/solutions/case-studies/slack/>
		Slack has a relatively simple IT architecture that is based on a broad range of AWS services, including i2.xlarge [Amazon Elastic Compute Cloud](https://aws.amazon.com/ec2/) (Amazon EC2) instances for basic compute tasks; [Amazon Simple Storage Service](https://aws.amazon.com/s3/) (Amazon S3) for users’ file uploads and static assets; and [Elastic Load Balancing](https://aws.amazon.com/elasticloadbalancing/) to balance workloads across Amazon EC2 instances. Slack uses [Amazon Elastic Block Store](https://aws.amazon.com/ebs/) (Amazon EBS) for nightly backups of MySQL instances running on Amazon EC2 i2s instances; the Amazon EBS volumes are attached to the instances and used as temporary storage before being sent to Amazon S3. Slack replaced hundreds of terabytes of Amazon EBS gp2 volumes with lower-cost Amazon EBS sc1 volumes for database backups. Since the switch, the company continues to grow the data on its user base.
		
		For security, Slack uses [Amazon Virtual Private Cloud](https://aws.amazon.com/vpc/) (Amazon VPC) to control security groups and firewall rules and AWS Identity and [Access Management](https://aws.amazon.com/iam/) (IAM) to control user credentials and roles. The company uses [Amazon CloudTrail](https://aws.amazon.com/cloudtrail/) for monitoring logs related to Amazon EC2 instances, and [Amazon Route 53](https://aws.amazon.com/route53/) for DNS management.
		
		Along with the AWS services, Slack is using the Redis data structure server, the Apache Solr search tool, the Squid caching proxy, and a MySQL database.
		![[./_resources/NetSPI_Approach_-_Slack_Demo.resources/slack-arch-diagram.png]]
* <https://slack.engineering/how-slack-built-shared-channels/#:~:text=Slack%20implements%20a%20client%2Dserver,main%20databases%20and%20job%20queues>![[./_resources/NetSPI_Approach_-_Slack_Demo.resources/1_KtQQdncaf492PVkz3DABSw.png]]
* Message proxy to terminate SSL before request is sent to message server via web sockets in below diagram
		<https://www.youtube.com/watch?v=_M-oHxknfnI&ab_channel=InfoQ>
		
* ![[./_resources/NetSPI_Approach_-_Slack_Demo.resources/image.png]]
* ![[./_resources/NetSPI_Approach_-_Slack_Demo.resources/image.1.png]]
* <https://slack.engineering/building-the-next-evolution-of-cloud-networks-at-slack/>

**Apps that have slack plugin or different system it talks to**

* Twitter, Dropbox, Google Docs, Jira, GitHub, MailChimp, Trello, and Stripe.
* Full list - <https://netspi.slack.com/apps/category/At64BY3G3F-essential-apps>

**Links:**
<https://d18rn0p25nwr6d.cloudfront.net/CIK-0001764925/b1ab8d05-51af-46aa-af7a-6264306163de.html> (Form 10-K on slack investors website)
