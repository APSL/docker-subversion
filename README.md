========================
Docker subversion image 
========================

Subversion image managed with circus. Config parameters managed with envtpl. 

Description
===========

Subversion docker image. Features:

* Authz Authentication config file.
* Config generated with envtpl. See env vars below.
* circus to control processes. http://circus.readthedocs.org/
* envtpl to setup config files on start time, based on environ vars. https://github.com/andreasjansson/envtpl
* See apsl/lamp base image for more info: https://registry.hub.docker.com/u/apsl/lamp/

As an example of envtpl, circus.ini itself is managed with envtpl

Env vars (default value shown)::

