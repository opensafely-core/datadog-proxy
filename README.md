# datadog-proxy

Builds a container to function as a web proxy for use with DataDog.

See: https://docs.datadoghq.com/agent/proxy/


## Deployed with Dokku

Dokku set up:
```console
dokku apps:create datadog-proxy
dokku git:set datadog-proxy deploy-branch main
dokku proxy:ports-add datadog-proxy http:80:5000
dokku domains:add datadog-proxy datadog-proxy.opensafely.org
```

Local git set up:
```console
git remote add dokku dokku@dokku2.ebmdatalab.net:datadog-proxy
git push dokku main
```


## Docker Agent

Datadog provide a [Docker agent](https://docs.datadoghq.com/agent/docker/)
but we need to push this to `opensafely-core` so we can access it.

```console
docker pull gcr.io/datadoghq/agent
docker tag gcr.io/datadoghq/agent ghcr.io/opensafely-core/datadog-agent
docker push ghcr.io/opensafely-core/datadog-agent
```
