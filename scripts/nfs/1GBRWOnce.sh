cat << EOF > /tmp/1GBRWOnce.yml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: $1 
spec:
  capacity:
    storage: 1Gi 
  accessModes:
  - ReadWriteOnce 
  nfs: 
    path: /srv/nfs/$1 
    server: support1.$2.internal 
  persistentVolumeReclaimPolicy: Recycle 
EOF
oc create -f /tmp/1GBRWOnce.yml

