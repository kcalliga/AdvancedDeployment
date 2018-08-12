cat << EOF > /tmp/5GBROMany.yml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: $1 
spec:
  capacity:
    storage: 5Gi 
  accessModes:
  - ReadOnlyMany 
  nfs: 
    path: /srv/nfs/$1 
    server: support1.$2.internal 
  persistentVolumeReclaimPolicy: Recycle 
EOF
oc create -f /tmp/5GBROMany.yml

