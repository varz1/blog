rsync -avz --delete \
  --rsync-path="sudo rsync" \
  ./public/ az:/var/www/blog.2rawzip.cc/

ssh az "sudo chown -R caddy:caddy /var/www/blog.2rawzip.cc"

