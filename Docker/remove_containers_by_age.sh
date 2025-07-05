docker ps -a -q | while read id; do
  created=$(docker inspect -f '{{.Created}}' $id)
  created_ts=$(date -d "$created" +%s)
  threshold_ts=$(date -d "20 months ago" +%s)
  if [ "$created_ts" -lt "$threshold_ts" ]; then
    echo "Removing container $id (created $created)"
    docker rm -f $id
  fi
done
