
configuration FileConfiguration {
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    node localhost {        
         File iis {
            Ensure = "Present"
            Contents = "THis is test content"
            DestinationPath = "C:\DSC2\abc.txt"
                   
        }        
    }    
}

FileConfiguration
