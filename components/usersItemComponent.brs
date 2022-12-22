sub init()
    m.userProfile = m.top.findNode("userProfile")
    m.editUserProfile = m.top.findNode("editUserProfile")
    m.userName = m.top.findNode("userName")
end sub

sub onHeightChanged()
    m.userProfile.width = m.top.width
    m.userProfile.height = m.top.height
end sub

sub onitemContentChanged()
    m.userProfile.uri = m.top.itemContent.HDPOSTERURL
    m.userName.text = m.top.itemContent.title
end sub 