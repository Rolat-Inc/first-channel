sub init()
    m.userProfile = m.top.findNode("userProfile")
    m.editUserProfile = m.top.findNode("editUserProfile")
    m.userName = m.top.findNode("userName")
    m.userDataName = m.top.findNode("userDataName")
    m.posterUser = m.top.findNode("posterUser")
    m.firstScreen = m.top.findNode("userComponentsAlignment")
    m.DataUserScreen = m.top.findNode("DataUserScreen")
end sub

sub onHeightChanged()
    m.userProfile.width = m.top.width
    m.userProfile.height = m.top.height
end sub

sub onitemContentChanged()
    m.userProfile.uri = m.top.itemContent.HDPOSTERURL
    m.userName.text = m.top.itemContent.title
    m.userDataName.text = m.userName.text
    m.posterUser.uri = m.userProfile.uri

    if m.top.itemContent.drawPencilEdit = true then
        m.editUserProfile.opacity = 1
    else if m.top.itemContent.drawPencilEdit = false 
        m.editUserProfile.opacity = 0.3
    end if
end sub 

sub onitemFocusChanged() 
end sub