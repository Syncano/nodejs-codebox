# nodejs-codebox


This repository containes a Dockerfile for a Node container with built in support for syncano.

You can build a container yourself or pull it from docker registry.

```
$ docker pull quay.io/syncano/nodejs-codebox
$ docker run -it quay.io/syncano/nodejs-codebox
```

In a container you can use syncano library for node:

```
var Syncano = require("syncano");
```

More info about the library is [here](https://github.com/Syncano/syncano-js-lib).
