# Bosch - SmartSite

# Architecture Diagram

![[./_resources/Bosch_-_SmartSite.resources/_bosch.png]]

# System Overview

![[./_resources/Bosch_-_SmartSite.resources/SystemOverviewRmS (1).jpg]]

# Documents Provided:

* [_bosch.comCloudDrivePTPJ-DCS_01_ITThreat+Risk1. System Overview-v74-20201026_150405.pdf](https://sig-confluence.internal.synopsys.com/download/attachments/718870107/_bosch.comCloudDrivePTPJ-DCS_01_ITThreat%2BRisk1.%20System%20Overview-v74-20201026_150405.pdf?version=1&modificationDate=1605046908854&api=v2)
* [CI and CD-v2-20201118_164439.pdf](https://sig-confluence.internal.synopsys.com/download/attachments/718870107/CI%20and%20CD-v2-20201118_164439.pdf?version=1&modificationDate=1605716442309&api=v2)
* [Hotfix Strategy-v40-20201118_164513.pdf](https://sig-confluence.internal.synopsys.com/download/attachments/718870107/Hotfix%20Strategy-v40-20201118_164513.pdf?version=1&modificationDate=1605716442572&api=v2)
* [Kalendar Tutorial.pdf](https://sig-confluence.internal.synopsys.com/download/attachments/718870107/Kalendar%20Tutorial.pdf?version=1&modificationDate=1605716443050&api=v2)
* [Registrieren Tutorial.pdf](https://sig-confluence.internal.synopsys.com/download/attachments/718870107/Registrieren%20Tutorial.pdf?version=1&modificationDate=1605716443815&api=v2)
* [RmS_Data_concept.pdf](https://sig-confluence.internal.synopsys.com/download/attachments/718870107/RmS_Data_concept.pdf?version=1&modificationDate=1605716444092&api=v2)

# Scope:

Meeting Notes from 11 Nov 2020 

## Attendees:

* Stan
* Viplove
* Irina Kimmel , ETSA
		Benjamin Höhensteiger - Solution Architect at Power Tools, Application Team PoC - [Benjamin.Hoehensteiger@de.bosch.com](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Bosch+-+SmartSitemailto:Benjamin.Hoehensteiger@de.bosch.com)
	
		Lars Dülfer - External - RefinemySite, Architect and Dev Lead - [lars.duelfer@novatec-gmbh.de](https://sig-confluence.internal.synopsys.com/display/~vkarhade/Bosch+-+SmartSitemailto:lars.duelfer@novatec-gmbh.de)
	
		Also some guys in Portugal (from Bosch) but did not attend the call
	

## Overview

SmartSite is a Task management system for construction site. 

## Business Goal

Solve problems of managing tasks for users which usually used to to be done by PostIt notes. Its a collaborative approach such as Agile and teams can co-operate and manage projects→ Tasks in an efficient manner. Analog approach in a digital way.

## Major Components:

* Android App - Used by End Users available over the internet 
* Main Web App - Used By End Users available over the internet
* Admin UI Web App - Bosch Users - restricted access based on IP
* Azure Application Gateway - Firewall 
* Spring Cloud Gateway - for routing requests
* REST based backend - Individual Spring Boot Applications on K8s Azure
* MySQL DB or Cosmos DB with Mongo API used as  service hosted on Azure
* Apache Kafka is used for communication via events, used as a Service hosted on Confluent Cloud
* OAuth AuthN is provided by CIAM : Bosch ID login via CIAM

## Out of Scope:

* SPLUNK
* CIAM
* Azure DB
* Confluent Cloud for Kafka

Events are mainly divided into three events (All 3 subscribed to events but also consumers):

1. User
2. Company 
3. Project

There are following user roles :

1. Foreman/Construction Worker
2. Customer Site Manager : from the general construction company or booked as consultant
3. Customer Representative : Company doing work onsite  for the

There are different environments like Dev, Test , QA PROD

Monitoring: Metrics - Prometheus with Grafana - dedicated cluster

SC-2 data : Customer information,Company, Craft, Daycard, User, Project
