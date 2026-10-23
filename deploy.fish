# usage: fish deploy.fish [cf]
#   (default)  rsync to the az server
#   cf         deploy to Cloudflare with wrangler
if test "$argv[1]" = cf
    env -u CLOUDFLARE_API_KEY -u CLOUDFLARE_EMAIL npx wrangler deploy --name blog --assets=./public --compatibility-date 2026-01-05
else
    rsync -avz --delete \
      --rsync-path="sudo rsync" \
      ./public/ az:/var/www/blog.2rawzip.cc/

    ssh az "sudo chown -R caddy:caddy /var/www/blog.2rawzip.cc"
end
