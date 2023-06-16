# docker-nginx-ssh

保留了nginx原镜像的所有功能, 保持设置一致(比如使用.template来让环境变量生效)

和原始项目相比
- 删除了nginx.conf使用nginx原镜像的配置文件
- 在entrypoint.sh中执行了nginx原镜像的docker-entrypoint.sh
- 删除了`/public`目录,
- 将`/usr/share/nginx/html`目录的所有者改为`publisher:publisher`
- 固定了nginx image的版本为`1.25`

Retained all the features of the original nginx image and kept the settings consistent (such as using .template to make environment variables effective).

Compared to the original project
- Removed nginx.conf to use the configuration file of the original nginx image
- Executed docker-entrypoint.sh from the original nginx image in entrypoint.sh
- Removed the `/public` directory.
- Changed the owner of the `/usr/share/nginx/html` directory to `publisher:publisher`
- Fixed the nginx image version to `1.25`

```
docker run -it -p 80:80 -p 22:22 \
  -e SSH_HOST_RSA_KEY="SSH_HOST_RSA_KEY_CONTENS" \
  -e SSH_HOST_RSA_PUBLIC_KEY="SSH_HOST_RSA_PUBLIC_KEY_CONTENS" \
  -e SSH_HOST_ECDSA_KEY="ECDSA_KEY_CONTENTS" \
  -e SSH_HOST_ECDSA_PUBLIC_KEY="SSH_HOST_ECDSA_PUBLIC_KEY_CONTENTS" \
  -e SSH_HOST_ED25519_KEY="SSH_HOST_ED25519_KEY_CONTENTS" \
  -e SSH_HOST_ED25519_PUBLIC_KEY="SSH_HOST_ED25519_PUBLIC_KEY_CONTENTS" \
  -e SSH_AUTHORIZED_KEY="Users authorized keys" \
  "you need to build this image"
```
