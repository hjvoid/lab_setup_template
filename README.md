# How To Spin Up a Quick Cyber Lab

+ Make sure you're in the root folder and run `sudo docker compose up -d --build`
+ When your machine has finished pulling in the specified images you should run `docker ps`
+ Now run `docker exec -it lab_setup_template-attacker-1 /bin/bash` to `ssh` into the attacker machine.
+ Check that everything is in order my running `ping -c 4 dvwa` or `ping -c 4 metasploitable`.
+ If you'd like any other tools on start up you can add them to the Dockerfile `Run` command.