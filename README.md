# nodejs-codebox

This repository contains Dockerfile for Node image with built-in support for Syncano, selected JS libraries and Node machines.

You can build the image yourself (requires Python packages: [requests](http://docs.python-requests.org/en/latest/), [jinja2](http://jinja.pocoo.org/docs/dev/) and connection to the Internet):

```
$ ./generate_package_json.py
$ docker build -t quay.io/syncano/nodejs-codebox .
```

or pull it from Docker registry:

```
$ docker pull quay.io/syncano/nodejs-codebox
```

Then you can run Docker container:

```
$ docker run -it quay.io/syncano/nodejs-codebox
>
```

In a container you can use Syncano's JS Library:

```
var Syncano = require("syncano");
```

More info about the library can be found [here](https://github.com/Syncano/syncano-js-lib).
