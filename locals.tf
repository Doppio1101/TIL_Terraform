locals {
  prefix = "JHCorp"
  env    = "Dev"
  
  default_tags = {
    # 계열사 구분
    Corp          = "JHCorp"
    # 서비스 운영팀
    Operation_Team = "JHCorpDevOpsTeam"
    # 서비스 구분
    Env = "Dev"
  }
}
