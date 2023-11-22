# /bin/sh
echo "start..."
cmd="'rethinkdb --bind all --http-port 8090'"
#echo ${cmd}
bash -c "nohup sh -c ${cmd} &"
