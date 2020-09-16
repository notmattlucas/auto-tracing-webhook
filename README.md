# Auto Tracing Webhook

A kubernetes webhook to automatically instrument any java application with open tracing abilities (without changing a line of code).

The webhook simply modifies the tagged deployment by adding the [java-specialagent](https://github.com/opentracing-contrib/java-specialagent) and setting up the environment correctly.

## Deploy

Ensure jaeger is installed:

```kubectl apply -f https://raw.githubusercontent.com/jaegertracing/jaeger-kubernetes/master/all-in-one/jaeger-all-in-one-template.yml```

Apply the webhook to kubernetes

```kubectl apply -f webhook.yml```

Tag your namespace with the ```autotrace``` label:

```kubectl label namespace default autotrace=enabled```

Tag your deployment's pod template with the autotrace label:

```
spec:
  replicas: 1
  selector:
    matchLabels:
      app: service-a
  template:
    metadata:
      name: service-a
      labels:
        app: service-a
        autotrace: enabled
```

Now when you deploy your java app it should automatically instrument and begin tracing.

## Generate Keys

```
mkdir keys
./generate-keys.sh keys
```

## Check Certificate Expiry

```
openssl x509 -subject -enddate -noout -in keys/ca.crt
openssl x509 -subject -enddate -noout -in keys/webhook-server-tls.crt
```

## Generate caBundle for webhook.yml

```
cat keys/ca.crt | base64 | tr -d "\n"
```

Add to webhook.yml