# Simple Client-server c cpp c++ language 
this repo is a simple client-server written in c/c++ to evaluate cicd doing build and testing

A server (server.c) is running in a Docker container, listening on port 8080. The container is exposing this port for outside connections.
The client (client.cpp) written in cpp is connecting and sending a buffer to this server and a reply is returned.
