sub init()
  m.usersProfilesRowlist = m.top.findNode("usersProfiles")
  createUserContentTask()
end sub

sub createUserContentTask()
  m.userContentTask = CreateObject("roSGNode", "usersContentTask")
  m.userContentTask.url = "https://api-nba-v1.p.rapidapi.com/teams"
  m.userContentTask.observeField("output", "onOutputChanged")
  m.userContentTask.control = "RUN"
end sub

sub onOutputChanged()
  m.usersProfilesRowlist.content = m.userContentTask.output
  m.usersProfilesRowlist.setFocus(true)

  m.userContentTask.unobserveField("output")
  m.userContentTask.control = "stop"
  m.userContentTask = invalid
end sub
