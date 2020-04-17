require_relative 'config/environment'

def banner
    box = TTY::Box.frame(width: 80, height: 20, border: :thick, align: :center) do
        "
        ######%%                                              
        ##            #%                                          
      ##                #*                                        
     %#                                                           
     #                    #     %###                              
     #                        .## ####                            
      #                      ##    #%##                           
        #          %##,#   ###      #  ## ###                     
           .     .#   %  ###         %  #######                   
       ##       #       %#                 #% %#                  
     %#   #.  %        #                    *   ##                
   .                 #                            #               
                                                    #             
                                                     *            
                                                       /          
                                                                  
                                                                  
                                                                  
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@,%@@.&@&%,&@@@&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@*@@. &*%.%@@(@/@@%,@@
  "end
      print box
      puts "\n"
end
banner
cli = Cli.new.welcome_menu


