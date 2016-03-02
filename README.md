-------------
### Jenkins 2.0 using ansible to provision it

#### Development instructions
```
git clone <git.repo>
vagrant up
```

If you add new roles to the `ansible/galaxy.yml` file remember to add them to `.gitignore` as `ansible/roles/<roleid>*` not the entire `ansible/roles` directory in case we need our own local roles


