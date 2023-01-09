sub init()
  m.customizedRowlist = m.top.findNode("usersProfiles")
  m.secondScreen = m.top.findNode("DataUserScreen")
  m.customizedRowlist.observeField("rowItemSelected", "displaySecondScreen")
  m.userDataName = m.top.findNode("userDataName")
  m.posterDataUser = m.top.findNode("posterDataUser")
  m.msWelcome = m.top.findNode("msWelcome")
  m.TeamsData = m.top.findNode("TeamsData")
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

sub displaySecondScreen()
 
  m.itemContentSelected = m.customizedRowlist.content.getChild(m.customizedRowlist.rowItemSelected[0]).getChild(m.customizedRowlist.rowItemSelected[1])

  if m.itemContentSelected.displayDetailScreen = true then
    m.customizedRowlist.visible = false
    m.secondScreen.visible = true
    m.userDataName.text = m.itemContentSelected.title
    m.posterDataUser.uri = m.itemContentSelected.HDPOSTERURL
    m.TeamsData.text = "Team name: " + m.itemContentSelected.Directors[0] + " City: " + m.itemContentSelected.Directors[1] + " Code Team: " + m.itemContentSelected.Directors[2] + " Nickname: " + m.itemContentSelected.Directors[3]
    m.msWelcome.visible = false
  end if
end sub


function onKeyEvent(key as String, press as Boolean) as Boolean
  handled = false
    if (press) then
      if key = "back" then
        m.itemContentSelected.displayDetailScreen = false
        m.customizedRowlist.visible = true
        m.secondScreen.visible = false
        m.msWelcome.visible = true
        handled = true
      end if
  end if
  return handled
end function
