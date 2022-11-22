sub init()
    m.userSelection = m.top.findNode("userSelection")
    m.userImage= m.top.findNode("userImage")
    m.userName= m.top.findNode("userName")
    m.editUser= m.top.findNode("editUser")

    m.top.observeField("focusedChild", "onFocusedChildChanged")
end sub

sub onFocusedChildChanged()
    if  m.top.isInFocusChain() then
        m.userSelection.visible = "true"
        m.userName.opacity = "1"
        m.userImage.opacity = "1"
        m.editUser.visible = "true"
    else 
        m.userSelection.visible = "false"
        m.userName.opacity = "0.3"
        m.userImage.opacity = "0.3"
        m.editUser.visible = "false"                
    end if
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    handled = false   
    if press then                         
        if key = "down" then                                       
            m.editUser.setFocus(true)
            if m.editUser.hasFocus()then
                    m.editUser.opacity = "1"  
            end if
            handled = true 
        else if key = "up" 
            m.editUser.setFocus(false)
            m.top.setFocus(true)
            m.editUser.opacity = "0.3"
        end if
        m.top.pencilHasFocus = m.editUser.hasFocus()
    end if
    return handled
end function
