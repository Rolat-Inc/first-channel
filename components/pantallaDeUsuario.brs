sub init()
    m.posterUserOne = m.top.findNode("imagen_de_usuario1")
    m.posterUserTwo = m.top.findNode("imagen_de_usuario2")
    m.posterUserThree = m.top.findNode("imagen_de_usaurio3")
    m.posterUserFour = m.top.findNode("imagen_de_usuario4")
    m.userSelection = m.top.findNode("userSelection")
    m.manageUsers = m.top.findNode("editarUsuarios")

    m.top.observeField("focusedChild", "onFocusedChildChanged")

    focusOn ()

end sub

sub focusOn ()
        m.posterUserOne.setFocus(true)
        m.posterUserOne.colorUser = "1"
        m.userSelection.visible =  true
        m.userSelection.translation = [261,398]
        
    
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false

    if press then
        
        if m.posterUserOne.hasFocus()
            if key = "right" then
                m.posterUserTwo.setFocus(true)
                m.posterUserTwo.colorUser = "1"
                m.posterUserOne.colorUser = "0.3"
                m.userSelection.translation = [630,398] 
            end if

        else if m.posterUserTwo.hasFocus() then
            if key = "right" then
                m.posterUserThree.setFocus(true)
                m.posterUserThree.colorUser = "1"
                m.posterUserTwo.colorUser = "0.3"
                m.userSelection.translation = [999,398]            
            else if key = "left" then
                 m.posterUserOne.setFocus(true)
                 m.posterUserOne.colorUser = "1"
                 m.posterUserTwo.colorUser = "0.3"
                 m.userSelection.translation = [261,398] 
            end if  
        
        
        else if m.posterUserThree.hasFocus()then
            if key = "right" then
                m.posterUserFour.setFocus(true)
                m.posterUserFour.colorUser = "1"
                m.posterUserThree.colorUser= "0.3"
                m.userSelection.translation = [1368,398]            
            else if key = "left" then
                 m.posterUserTwo.setFocus(true)
                 m.posterUserTwo.colorUser = "1"
                 m.posterUserThree.colorUser = "0.3"
                 m.userSelection.translation = [630,398] 
            end if  
       

        else if m.posterUserFour.hasFocus()then
                     
            if key = "left" then
                 m.posterUserThree.setFocus(true)
                 m.posterUserThree.colorUser = "1"
                 m.posterUserFour.colorUser = "0.3"
                 m.userSelection.translation = [999,398]     
            end if
        end if  

        if key = "down" then
            m.manageUsers.opacity = "1"
        else 
            m.manageUsers.opacity = "0.5"
        end if  

    end if
    return handled

end function


