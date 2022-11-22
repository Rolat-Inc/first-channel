
sub Main()
    print "in showChannelSGScreen"
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("PantallaDeUsuario")
    scene.backgroundColor= "0x000000"
    scene.backgroundUri = ""
    screen.show() 
  
    while(true)
      msg = wait(0, m.port)
      msgType = type(msg)
  
      if msgType = "roSGScreenEvent"
      if msg.isScreenClosed() then return
      end if
    end while
end sub