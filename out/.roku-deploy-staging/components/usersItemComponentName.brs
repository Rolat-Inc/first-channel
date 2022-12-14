sub init()
    m.usersProfiles = m.top.findNode("usersProfiles")
    m.editUsersProfiles = m.top.findNode("editUsersProfiles")
    m.userName = m.top.findNode("userName")
end sub

sub OnWidthChanged()
    m.usersProfiles.width = 380
    m.usersProfiles.height = 250
end sub

sub OnitemContentChanged()
    m.usersProfiles.uri = m.top.itemContent.HDPOSTERURL
    m.userName.text = m.top.itemContent.title
end sub 