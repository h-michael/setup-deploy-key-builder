# setup-deploy-key-builder

## Examples

```
steps:
- name: 'gcr.io/{$PROJECT_ID}/setup-deploy-key-builder'
  args: ['secret', 'name']
  volumes:
  - name: 'ssh'
    path: /root/.ssh

- name: "gcr.io/cloud-builders/git"
  dir: .
  entrypoint: "bash"
  args:
  - "-c"
  - "git clone --depth=1 git@github.com:owner_name/repo_name"
```
