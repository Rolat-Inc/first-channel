sub init()
    m.top.functionName = "importUsersData"
    m.videos=[
      "http://sample.vodobox.net/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8",  
      "https://cdn.bitmovin.com/content/assets/art-of-motion_drm/m3u8s/11331.m3u8",
      "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8",
      "http://d3rlna7iyyu8wu.cloudfront.net/skip_armstrong/skip_armstrong_stereo_subs.m3u8",
      "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
      "https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8",
      "https://assets.afcdn.com/video49/20210722/v_645516.m3u8",
      "http://playertest.longtailvideo.com/adaptive/wowzaid3/playlist.m3u8",
      "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8",
      "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
    ]
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
  
  for i = 0 to 9
    userContent = responseApi.response[i]
    userProfilesContentGrandChild = usersInfoChild.createChild("ContentNode")
    userProfilesContentGrandChild.title = userContent.nickname
    userProfilesContentGrandChild.HDPOSTERURL = userContent.logo   
    userProfilesContentGrandChild.Directors = [userContent.name, userContent.city, userContent.code,userContent.nickname]
    userProfilesContentGrandChild.addField("drawPencilEdit", "boolean", false) 
    userProfilesContentGrandChild.setField("drawPencilEdit",false)
    userProfilesContentGrandChild.addField("displayDetailScreen", "boolean", false) 
    userProfilesContentGrandChild.setField("displayDetailScreen",false)
    userProfilesContentGrandChild.addField("displayVideo", "boolean", false) 
    userProfilesContentGrandChild.setField("displayVideo",false)
    userProfilesContentGrandChild.url = m.videos[i]
  end for

  m.top.output = usersProfilesContentFather
  
end sub
