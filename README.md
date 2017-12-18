# PG Stat Activity Monitor

## Overview

A simple web page that displays non-idle postgresql connections. Autovacuum processes are also not included.

## Prerequisites

 - Java 8
 - Maven

## Setup

Clone repository: 
```
$ git clone https://github.com/astercrono/pgstat-monitor
```

Change directory: 
```
$ cd pgstat-monitor
```

Open ```application.properties``` and change the connection parameters:
```
spring.datasource.url=jdbc:postgresql://URL:PORT/DATABASE_NAME
spring.datasource.username=USERNAME
spring.datasource.password=PASSWORD
```

## Launch

Start server: 
```
$ mvn spring-boot:run
```

Open browser at: 
```
localhost:8090/pgStatMonitor
```

## Configuration
By default, the activity query filters out idle connections and autovacuums. Not all columns in the pg_stat_activity view are also shown. To make adjustments to the query, edit the ```pgamon.sql``` property in ```application.properties```. This query can be enhanced in any way, or even rewritten, as long as it returns the same columns with the same data types.

If you wish to make column changes, three pieces need to be updated:
 - The Freemarker template: ```pgStatMonitor.ftl```
 - The model class: ```PGStat.java```
 - The dataacess object's row mapper. Refer to ```DefaultPGStatDao.java```

In addition to the query, you may wish to change one or more of the following configs:
 - ```pgamon.refreshInterval```: Seconds between each page refresh.
 - ```pgamon.warningThreshold```: Query duration, in minutes, that controls when a row is turned orange.
 - ```pgamon.dangerThreshold```: Query duration, in minutes, that controls when a row is turned red. 

There are other configs. You can read them in ```application.properties```. The default port is 8090 so that it does not conflict with another application server.

## Notes

In postgresql 9.6, the ```waiting``` column was removed and replaced with ```wait_event_type``` and ```wait_event```. For this reason, both the model class and template are setup with a single ```wait``` column. The default query concatenates the new columns into this single field. 