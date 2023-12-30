## locally

```sh
make setup
```

run
```sh
F="a.go" air
```

lint / as pre-commit hooks
```sh
make lint
```

## remote

```sh
git -C ~/projects/my/go_boiler ls | grep -v "^go." | xargs -n1 -t -I{} cp ~/projects/my/go_boiler/{} ./
```
