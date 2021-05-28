# arch-as-graph-code prototype

🚧 This is prototype

## Hypothesis

We can define an architecture model with the MERGE semantics that the
Cypher query language provides

The service defines:
- its own `this:Container` node
- the C4 Software system it belongs to with `itsSystem:SoftwareSystem`
- the read/write semantics of its integrations

All of the nodes are created with a `MERGE` operation, so if the target
graph already contains this node or relationship, it's a no-op

It is _possible_ that this way and with some conventions all
applications could self-describe the entire architecture, without a
centralised model

## How?

During mainline CI, the job could apply the query against a centralised
graph database, which would then be extended with the up-to-date model

## How to run

You will need
- Docker

`./run.sh` will start up a dockerised Neo4J

`./apply.sh` will apply all model fragments, simulating each folder as a separate git repo

## Viewing the results

Navigate to http://localhost:7474/browser/.

To visualise all containers:
```
MATCH (n:Container)
RETURN n
```

To visualise everything:
```
MATCH (n) RETURN n
```

To delete everything:
```
MATCH (n) DETACH DELETE n
```
