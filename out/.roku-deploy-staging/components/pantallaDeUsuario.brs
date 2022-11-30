sub init()
  m.usersProfilesRowlist = m.top.findNode("usersProfiles")
  createObjectUsersInfo()
  m.usersProfilesRowlist.content = createRowListContent()
  m.usersProfilesRowlist.setFocus(true)
end sub

sub createObjectUsersInfo()
  m.usersMetadata = {
    users: [
      {
        "name": "Fernanda",
        "image": "pkg:/images/usuario1.jpg"
      },
      {
        "name":"Mariano",
        "image":"pkg:/images/usuario2.jpg"
      },
      {
        "name":"Camila",
        "image":"pkg:/images/usuario3.jpg"
      },
      {
        "name":"Juan Pablo",
        "image":"pkg:/images/usuario4.jpg"
      } 
    ]
  }
end sub

function createRowListContent()
  usersProfilesContentFather = CreateObject("RoSGNode","ContentNode")
  usersInfoChild = usersProfilesContentFather.createChild("ContentNode")

  for i = 0 to m.usersMetadata.users.count() - 1
    userContent = m.usersMetadata.users [i]

    userProfilesContentGrandChild = usersInfoChild.createChild("ContentNode")
    userProfilesContentGrandChild.title = userContent.name
    userProfilesContentGrandChild.HDPOSTERURL = userContent.image
  end for
  return usersProfilesContentFather
end function