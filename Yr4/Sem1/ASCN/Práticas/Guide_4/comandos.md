# Persistent Volumes Configuration

Check the nodes of the cluster

`kubectl get nodes`

Make PV folder on worker VMs

`sudo mkdir -p /mnt/data`

Create Storage Class and two PV objects on master VM

`kubectl apply -f persistent-volume.yml`

List SC objects

`kubectl get sc`

List PV objects

`kubectl get pv`

# MySQL Container Deployment

Create Persistent Volume Claim (PVC) object

`kubectl apply -f mysql/mysql-pvc.yml`

`kubectl get pvc`

Create deployment object

`kubectl apply -f mysql/mysql-deployment.yml`

List all objects

`kubectl get all`

Create MySQL Service

`kubectl apply -f mysql/mysql-service.yml`

Verificar acesso à BD

`kubectl exec -it pod/mysql-deployment-5669bfb689-xx4t6 -- mysqladmin --host=0.0.0.0 --user=swapuser --password=123456 status`

# Swap Container Deployment

Swap deployment

`kubectl apply -f swap/swap-deployment.yml`

`kubectl apply -f swap/swap-service.yml`

Seed database

`kubectl exec -it swap-deployment-7f8f9b9c4b-522jv -- php artisan db:seed`