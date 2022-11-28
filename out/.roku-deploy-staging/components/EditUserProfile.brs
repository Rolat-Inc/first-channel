sub init()
    m.UserName = m.top.findNode("UserName")
    m.posterUser = m.top.findNode("posterUser")
end sub

sub onContentChanged()
    m.UserName.text = m.top.content.title
    m.posterUser.uri = m.top.content.HDPosterUrl
end sub
