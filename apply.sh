#!/bin/sh -e
find . -name '*.cypher' \
  -exec echo "Processing " {} \; \
  -exec sh -c "docker exec -i testneo4j cypher-shell -u neo4j -p test < \$1" _ {} \;
