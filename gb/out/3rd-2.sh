#!/bin/bash
#frank

scp -P 6343 /var/gb/apps/jar_repo/soul-model-1.0.1-SNAPSHOT.jar 3rd-2:/var/gb/apps/gather-client/WEB-INF/lib
scp -P 6343 /var/gb/apps/jar_repo/soul-commons-1.0.1-SNAPSHOT.jar 3rd-2:/var/gb/apps/gather-client/WEB-INF/lib
scp -P 6343 /var/gb/apps/jar_repo/soul-cache-1.0.1-SNAPSHOT.jar 3rd-2:/var/gb/apps/gather-client/WEB-INF/lib
scp -P 6343 /var/gb/apps/jar_repo/gather-commons-1.0.1-SNAPSHOT.jar 3rd-2:/var/gb/apps/gather-client/WEB-INF/lib
scp -P 6343 /var/gb/apps/jar_repo/gather-api-1.0.1-SNAPSHOT.jar 3rd-2:/var/gb/apps/gather-client/WEB-INF/lib
scp -P 6343 /var/gb/apps/jar_repo/gather-client-1.0.1-SNAPSHOT.jar 3rd-2:/var/gb/apps/gather-client/WEB-INF/lib
scp -P 6343 /var/gb/apps/jar_repo/gather-model-1.0.1-SNAPSHOT.jar 3rd-2:/var/gb/apps/gather-client/WEB-INF/lib

echo "3rd-2 jar包已经更新完毕,请重启3rd-2的 gb-gather-client.3rd-2！！！"
