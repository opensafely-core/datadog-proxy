# datadog-proxy

Builds a container to function as a web proxy for use with DataDog.

See: https://docs.datadoghq.com/agent/proxy/

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
