MERGE (itsSystem:SoftwareSytem {id:"hmpps-interventions"})
  ON CREATE SET itsSystem.name = "Refer and monitor an intervention"

MERGE (this:Container {id:"hmpps-interventions-ui"})
  SET this.source  = "https://github.com/ministryofjustice/hmpps-interventions-ui"
  MERGE (this)-[:belongs_to]->(itsSystem)

MERGE (service:Container {id:"hmpps-interventions-service"})
  MERGE (this)-[:writes_to]->(service)
  MERGE (this)-[:reads_from]->(service)

MERGE (capi:Container {id:"community-api"})
  MERGE (this)-[:reads_from]->(capi)

MERGE (auth:Container {id:"hmpps-auth"})
  MERGE (this)-[:reads_from]->(auth)
