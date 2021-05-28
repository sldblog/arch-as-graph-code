MERGE (itsSystem:SoftwareSytem {id:"hmpps-interventions"})
  ON CREATE SET itsSystem.name = "Refer and monitor an intervention"

MERGE (this:Container {id:"hmpps-interventions-service"})
  SET this.source  = "https://github.com/ministryofjustice/hmpps-interventions-service"
  SET this.apiDoc  = "https://hmpps-interventions-service-dev.apps.live-1.cloud-platform.service.justice.gov.uk/swagger-ui.html"
  SET this.dataDoc = "https://hmpps-interventions-service-dev.apps.live-1.cloud-platform.service.justice.gov.uk/meta/schema/"
  MERGE (this)-[:belongs_to]->(itsSystem)

MERGE (communityApi:Container {id:"community-api"})
  MERGE (this)-[:writes_to]->(communityApi)

MERGE (auth:Container {id:"hmpps-auth"})
  MERGE (this)-[:reads_from]->(auth)
