# filebeat-curator

This container uses [Elasticsearch Curator](https://github.com/elastic/curator)
to delete old [Filebeat](https://www.elastic.co/products/beats/filebeat) indexes

## Configuration

Some configuration can be tuned with the following environment variables

|Variable|Required|Description|Default|
|---|---|---|---|
|`ES_HOST`|Yes|The host of the Elasticsearch server|`elasticsearch`|
|`ES_PORT`|No|The port of the Elasticsearch server|`443`|
|`ES_PREFIX`|No|Prefix to append to the URLs|(none)|
|`ES_SSL`|No|Use SSL to connect to Elasticsearch|`True`|
|`DAYS`|No|Delete indices older than this number of days|`30`|

## Rancher

In Rancher, it can be used in combination with the built-in cron service to run automatically every day.
Just make sure the [Container Crontab](https://github.com/rancher/container-crontab) service is running in your environment.
It can be easily started from the catalog.

```yaml
version: '2'
services:
  curator:
    image: instedd/filebeat-curator
    environment:
      ES_HOST: elasticsearch.domain.com
      DAYS: '15'
    labels:
      io.rancher.container.start_once: 'true'
      io.rancher.container.pull_image: always
      cron.schedule: '@daily'
```
