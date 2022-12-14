sub init()
    m.top.functionName = "importUsersData"
end sub
  
function importUsersData()
  request = CreateObject("roUrlTransfer")
  request.SetCertificatesFile("common:/certs/ca-bundle.crt")
  request.AddHeader("X-Roku-Reserved-Dev-Id", "")
  request.AddHeader("X-RapidAPI-Key", "36bc968a0fmsh43df5fc25d35121p18b039jsn5fc1cb60412d")
  request.AddHeader("X-RapidAPI-Host", "api-nba-v1.p.rapidapi.com")
  request.InitClientCertificates()
  request.SetUrl(m.top.url) 
  answerApi = ParseJson(request.GetToString()) 

  createUsersContentNodeApi(answerApi)

  end function

sub createUsersContentNodeApi(answerApi as object)

 usersProfilesContentFather = CreateObject("RoSGNode","ContentNode")
 usersInfoChild = usersProfilesContentFather.createChild("ContentNode")

  for i = 0 to answerApi.response.count()-60
    userContent = answerApi.response[i]

    userProfilesContentGrandChild = usersInfoChild.createChild("ContentNode")
    userProfilesContentGrandChild.title = userContent.nickname
    userProfilesContentGrandChild.HDPOSTERURL = userContent.logo

  end for
  m.top.output = usersProfilesContentFather
end sub