docker run -it --rm --network devenv_default ^
-v d:/Repo/go/src:/go/src ^
-v d:/Repo/Bitcentral/iris-queue-processor:/home/node/iris-queue-processor ^
bc/go-node /bin/bash