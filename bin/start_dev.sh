#!/bin/bash

docker run -d --name mycontainer -p 80:80 -v $(pwd)/app:/app -e FLASK_APP=main.py -e FLASK_DEBUG=1 myimage flask run --host=0.0.0.0 --port=80
