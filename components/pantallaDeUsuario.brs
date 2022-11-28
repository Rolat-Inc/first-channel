sub init()
    m.userOne = m.top.findNode("userOne")
    m.userTwo = m.top.findNode("userTwo")
    m.userThree = m.top.findNode("userThree")
    m.userFour = m.top.findNode("userFour")
    m.userOne.setFocus(true)
    m.postersUsers = m.top.findNode("postersUsers")
    m.msWelcome = m.top.findNode("msWelcome")
    m.secondScreen = m.top.findNode("secondScreen")   
    setUserProfileContent()
end sub

sub setUserProfileContent()
    m.userOne.content = createUserProfileContent("Fernanda","pkg:/images/usuario1.jpg")
    m.userTwo.content = createUserProfileContent("Mariano", "pkg:/images/usuario2.jpg")
    m.userThree.content = createUserProfileContent("Camila","pkg:/images/usuario3.jpg")
    m.userFour.content = createUserProfileContent("Juan Pablo","pkg:/images/usuario4.jpg")
end sub

function createUserProfileContent(name as string, url as string)
    cnUser = createObject("RoSGNode", "ContentNode")
    cnUser.title = name
    cnUser.HDPosterUrl = url
    return cnUser
end function

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false
    if press then         
        if m.userOne.isInFocusChain() then
            if key = "OK" then
                if  m.userOne.pencilHasFocus = true then
                        offFirstScreen()
                        m.secondScreen.content = m.userOne.content
                end if   
            else if key = "right" then
                m.userTwo.setFocus(true)
            end if
        else if m.userTwo.isInFocusChain() then
            if key = "OK" then
                if  m.userTwo.pencilHasFocus = true then
                         offFirstScreen()
                         m.secondScreen.content = m.userTwo.content
                end if
            else if key = "right" then
                m.userThree.setFocus(true)      
            else if key = "left" then
                m.userOne.setFocus(true)
            end if       
        else if m.userThree.isInFocusChain()then
            if key = "OK" then
                if  m.userThree.pencilHasFocus = true then
                        offFirstScreen()
                        m.secondScreen.content = m.userThree.content
                end if
            else if key = "right" then
                m.userFour.setFocus(true)    
            else if key = "left" then
                m.userTwo.setFocus(true)
            end if  
        else if m.userFour.isInFocusChain()then  
            if key = "OK" then
                if  m.userFour.pencilHasFocus = true then
                        offFirstScreen()
                        m.secondScreen.content = m.userFour.content
                end if               
            else if key = "left" then
                m.userThree.setFocus(true)
            end if
        end if 
    end if
  return handled
end function

sub offFirstScreen()
    m.msWelcome.visible = false
    m.postersUsers.visible = false
    m.secondScreen.visible = true    
end sub