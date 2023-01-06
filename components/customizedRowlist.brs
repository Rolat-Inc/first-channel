sub init()
    
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    m.itemFocused = m.top.content.getChild(m.top.rowItemFocused[0]).getChild(m.top.rowItemFocused[1])
    handled = false   
    if (press) then                         
        if (key = "down") then       
            m.top.focusBitmapUri=""    
            m.itemFocused.drawPencilEdit=true
        else if m.itemFocused.drawPencilEdit=true and key = "OK" then
                print "Desplegar segunda pantalla"
        else       
            m.top.focusBitmapUri="pkg:/images/focus_grid.9.png"   
            m.itemFocused.drawPencilEdit=false
        end if
    end if
    return handled
end function

