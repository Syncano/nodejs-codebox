# nodejs-codebox

This repository contains Dockerfile for Node 5.0.0 image with built-in support for Syncano, selected JS libraries and Node machines.

You can build the image yourself (requires Python packages: [requests](http://docs.python-requests.org/en/latest/), [jinja2](http://jinja.pocoo.org/docs/dev/) and connection to the Internet):

```
$ ./generate_package_json.py
$ ./create_nodejs_image.sh
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

# Adding Packages

To add a package, please create a Pull Request from a fork or branch into `master` after adding the package with a specific version number to [this file (nodejs/files/package.json.v10)](https://github.com/Syncano/nodejs-codebox/blob/intercom-sdk/nodejs/files/package.json.v10).