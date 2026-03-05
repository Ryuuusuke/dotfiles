{
        services.hypridle = {
                enable = true;
                settings = {
                        listener = [
                        {
                                timeout = 1200;   # 20 min
                                on-timeout = "systemctl suspend";
                        } 
                        ];
                };
        };
}
