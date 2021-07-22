#!/bin/sh -e
find . -name '*.cypher' \
  -exec echo "Processing " {} \; \
  -exec sh -c "docker exec -i testneo4j cypher-shell -u neo4j -p test < \$1" _ {} \;

echo
echo "𐂷 Current merged state:"
docker exec -i testneo4j cypher-shell -u neo4j -p test <<END
MATCH (a)-[r]->(b) RETURN labels(a), a.id, r, labels(b), b.id;
END
