helm uninstall wis 
kubectl delete pvc --all
kubectl delete pvc --all
helm dep update ./wmowis
