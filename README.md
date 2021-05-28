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
