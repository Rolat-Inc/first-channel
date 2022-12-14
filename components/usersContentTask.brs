sub init()
    m.top.functionName = "createRowListContent"
end sub

function createRowListContent()

    usersMetadata = createObjectUsersInfo()
    usersProfilesContentFather = CreateObject("RoSGNode","ContentNode")
    usersInfoChild = usersProfilesContentFather.createChild("ContentNode")
  
    for i = 0 to usersMetadata.users.count() - 1
      userContent = usersMetadata.users [i]
  
      userProfilesContentGrandChild = usersInfoChild.createChild("ContentNode")
      userProfilesContentGrandChild.title = userContent.name
      userProfilesContentGrandChild.HDPOSTERURL = userContent.image
    end for
    m.top.output = usersProfilesContentFather
end function

function createObjectUsersInfo()
    usersMetadata = {
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
    return usersMetadata
end function
  
  