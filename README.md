# nodejs-codebox


This repository containes a Dockerfile for a Node container with built in support for syncano.

You can build a container yourself (demands Python packages: requests and jinja2) or pull it from docker registry.

```
$ ./generate_package_json.py
$ docker pull quay.io/syncano/nodejs-codebox
$ docker run -it quay.io/syncano/nodejs-codebox
```

In a container you can use syncano library for node:

```
var Syncano = require("syncano");
```

More info about the library is [here](https://github.com/syncano/syncano-js).
