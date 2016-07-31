#Headphones
An Alpine Linux based dockerfile to run the music management program Headphones. It expects a  partition to store data mapped to /config in the container, and a volume where your downloads should go stored at /media. Enjoy!

This dockerfile uses a user with uid 526. Make sure this user has write access to the /config folder. 
##Example run command
`docker run -d --restart=always --name Headphones --volumes-from Data --volumes-from media -p 8181:8181 adamant/headphones`
