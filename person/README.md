# person microservice

We will use this microservice to learn helm.

To create a helm chart:

> helm create person

Above command will create a folder person with following structure:

```
person
├── Chart.yaml
├── charts
├── templates
│   ├── NOTES.txt
│   ├── _helpers.tpl
│   ├── deployment.yaml
│   ├── ingress.yaml
│   └── service.yaml
└── values.yaml
```

change repository and tag in the file values.yaml to:

```
image:
  repository: hiprabhat/ecommerce-person
  tag: v1
  pullPolicy: IfNotPresent
```

change containerPort in person/templates/deployment.yaml to:

```
  ports:
    - name: http
      containerPort: 8080
```


Run the below command to deploy using helm 

> helm install person --name=person

Let's check what we deployed

> kubectl get deploy,rs,pod,svc

Output

```
NAME                           READY   UP-TO-DATE   AVAILABLE   AGE
deployment.extensions/person   0/1     1            0           19m

NAME                                      DESIRED   CURRENT   READY   AGE
replicaset.extensions/person-5d8bccdf95   1         1         0       19m

NAME                          READY   STATUS             RESTARTS   AGE
pod/person-5d8bccdf95-ls2g7   0/1     CrashLoopBackOff   9          19m

NAME             TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
service/person   ClusterIP   172.20.147.72   <none>        80/TCP    19m
```

Now let's access our service using port-forwarding:

> kubectl port-forward svc/person 8081:80

You can now access your service on http://localhost:8081

You should see the output:

```json
{
uid: 1,
uname: "Prabhat Sharma"
}
```

Type Cmd +C (on mac), Ctrl+c (on Windows, linux) to stop port forwarding

Now let's upgrade our deployment

Go ahead and change the tag in the values.yaml file to v2:

```
image:
  repository: hiprabhat/ecommerce-person
  tag: v2
  pullPolicy: IfNotPresent
```

Now let's upgrade our deployment
> syntax: helm upgrade &lt;release-name&gt; &lt;chart-path&gt; -f values.yaml

> helm upgrade person ./person -f person/values.yaml

Now let's port-forward and check our service again

> kubectl port-forward svc/person 8081:80


Let's point our browser to http://localhost:8081

You should get the following output:

```json
{
uid: 1,
uname: "Prabhat Sharma v2"
}
```

