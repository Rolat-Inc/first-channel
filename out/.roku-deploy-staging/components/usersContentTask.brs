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
  responseApi = ParseJson(request.GetToString()) 

  createUsersContentNodeApi(responseApi)
end function

sub createUsersContentNodeApi(responseApi as object)

  usersProfilesContentFather = CreateObject("RoSGNode","ContentNode")
  usersInfoChild = usersProfilesContentFather.createChild("ContentNode")

  usersCounterArray = responseApi.response.count() - responseApi.response.count() +3
  
  for i = 0 to usersCounterArray
    userContent = responseApi.response[i]

    userProfilesContentGrandChild = usersInfoChild.createChild("ContentNode")
    userProfilesContentGrandChild.title = userContent.nickname
    userProfilesContentGrandChild.HDPOSTERURL = userContent.logo

  end for
  m.top.output = usersProfilesContentFather
end sub