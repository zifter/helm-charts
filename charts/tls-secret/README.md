# tls secret

## Usage
To install tls secret you need.

### Add helm repository
```bash
helm repo add zifter https://zifter.github.io/helm-charts/
```

### Install chart
```bash
helm install tls-secret zifter/tls-secret --namespace kube-system -f values-domain.yaml
```

where values-domain.yaml is:
```yaml
name: "my-wildcard-secret"
tls:
  key: "YOU PUBLIC KEY"
  crt: "YOU PRIVATE KEY"
```
