

#### bot 300


In this latest version of simulation environment initially developed for testing, we could use interprocess communication abilities of nodejs; however if we do so it won't work when we want to have a bunch of processes that are separated by, and rather than making another transport when that time comes can just do the communications by websocket to begin with.




Composer process starts up a primus server, it connects clients to the ~~terebinth-system~~ and brujo-terminal servers. -- actually it should just need the brujo-term parts, while the bots should just need the terebinth system parts.

Then it spawns bot processes, but instead of communicating with these via interprocess comms api given by nodejs, these processes call back to the composer/master node, to request an id which will persist over their process lifetime (it will persist over spark lifetimes if there are disconnects)







### how-to:

From the same dir as this readme doc:


`nodemon -w ./bot_300/ -w ./composer_300/ system_type_300.coffee`
