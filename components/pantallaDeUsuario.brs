sub init()

  m.customizedRowlist = m.top.findNode("usersProfiles")
  createUserContentTask()


end sub

sub createUserContentTask()
  m.userContentTask = CreateObject("roSGNode", "usersContentTask")
  m.userContentTask.url = "https://api-nba-v1.p.rapidapi.com/teams"
  m.userContentTask.observeField("output", "onOutputChanged")
  m.userContentTask.control = "RUN"

end sub

sub onOutputChanged()
  m.customizedRowlist.content = m.userContentTask.output
  m.customizedRowlist.setFocus(true)
  m.userContentTask.unobserveField("output")
  m.userContentTask.control = "stop"
  m.userContentTask = invalid

end sub
