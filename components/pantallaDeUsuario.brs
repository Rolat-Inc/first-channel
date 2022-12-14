sub init()
  m.usersProfilesRowlist = m.top.findNode("usersProfiles")
  createUserContentTask()
end sub

sub createUserContentTask()
  m.userContentTask = CreateObject("roSGNode", "usersContentTask")
  m.userContentTask.observeField("output", "onUserContentTaskCheanged")
  m.userContentTask.control = "RUN"
end sub

sub onUserContentTaskCheanged()
  m.usersProfilesRowlist.content = m.userContentTask.output
  m.usersProfilesRowlist.setFocus(true)

  m.userContentTask.unobserveField("output")
  m.userContentTask.control = "stop"
  m.userContentTask = invalid
end sub
