Dependencies:

- Hugo version >= v0.113.0+extended

## Installation

Refer to <https://gohugo.io/installation/>

## Build

```bash
hugo mod get -u
hugo
```

## New Post

```bash
./new post-title
```

## Preview

```bash
hugo serve
```


## Deploy

Pushing to `main` publishes the site automatically; there is nothing to run by hand.

```bash
git add -A
git commit -m "post: ..."
git push
```
