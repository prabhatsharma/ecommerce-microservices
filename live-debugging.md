# Live debugging using Telepresence

1. [Install telepresence](https://www.telepresence.io/reference/install)
2. clone the repo

> $ git clone https://github.com/prabhatsharma/ecommerce-microservices


3. Deploy all microservices

> ./deploy-app.sh

4. Verify the deployment

> kubectl get pod,services

<pre>
NAME                                                        READY   STATUS    RESTARTS   AGE
pod/person-96d44f4fd-2trqp                                  1/1     Running   0          5m50s
pod/product-7dd48bb785-mwm2p                                1/1     Running   0          5m49s
pod/recommendation-v1-8449bfb584-wlbp4                      1/1     Running   0          5m48s
pod/review-v1-8565b4d6f7-m4zkp                              1/1     Running   0          5m47s
pod/telepresence-1573028244-055338-49272-6d95b9d9cf-9s7xh   1/1     Running   0          2m38s

NAME                     TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
service/person           ClusterIP   172.20.191.35    <none>        80/TCP    5m50s
service/product          ClusterIP   172.20.252.145   <none>        80/TCP    5m49s
service/recommendation   ClusterIP   172.20.47.37     <none>        80/TCP    5m47s
</pre>

5. Run telepresence.

> telepresence

It will ask for local root password in order to be able to set VPN tunnel. Wait ill you get the terminal prompt back.



