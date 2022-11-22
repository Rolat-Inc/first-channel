sub init()
    m.userOne = m.top.findNode("userOne")
    m.userTwo = m.top.findNode("userTwo")
    m.userThree = m.top.findNode("userThree")
    m.userFour = m.top.findNode("userFour")
    m.userOne.setFocus(true)
    m.posterUSer = m.top.findNode("posterUser")
    m.msWelcome = m.top.findNode("msWelcome")
    m.secondScreen = m.top.findNode("loadSecondScreen")   
end sub

'commit de prueba

function onKeyEvent(key as String, press as Boolean) as Boolean
    print "pantalla del usuario "; key
    handled = false
    if press then         
        if m.userOne.isInFocusChain() then
            if key = "OK" then
                if  m.userOne.pencilHasFocus = true then
                        offFirstScreen()
                        m.secondScreen.userEditName = m.userOne.profileName
                        m.secondScreen.userPoster = m.userOne.locateImage
                end if    
            else if key = "right" then
                m.userTwo.setFocus(true)
            end if
        else if m.userTwo.isInFocusChain() then
            if key = "OK" then
                if  m.userTwo.pencilHasFocus = true then
                         offFirstScreen()
                         m.secondScreen.userEditName = m.userTwo.profileName
                        m.secondScreen.userPoster = m.userTwo.locateImage
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
                        m.secondScreen.userEditName = m.userThree.profileName
                        m.secondScreen.userPoster = m.userThree.locateImage
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
                        m.secondScreen.userEditName = m.userFour.profileName
                        m.secondScreen.userPoster = m.userFour.locateImage
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
        m.posterUSer.visible = false
        m.secondScreen.visible = true
    end sub

