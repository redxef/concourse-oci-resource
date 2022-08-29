# concourse-oci-resource

A resource type for oci image tarballs.

## Source configuration

```yaml
resource_types:
- name: oci-image
  type: registry-image
  source:
    repository: redxef/concourse-oci-resource
resources:
- name: my-image
  type: oci-image
  source:
    repository: redxef/concourse-oci-resource
    tag: latest
    username: ((registry.username))
    password: ((registry.password))
```

- repository: *Required*. The URI of the image repository.
- tag: *Optional*. *Default* `latest`. The tag of this image.
- username: *Optional*. Username used to authenticate.
- password: *Optional*. Password used to authenticate.

## `check`

Check if there is a new version represented with the given source
configuration.

## `in` receive a OCI tarball

Creates the following files:

- `./image.tar`: The image tarball.
- `./digest`: A file containing the digest of the pulled image.
- `./repository`: The repository name (the same as the source configuration).

## `out` push an image to a repository

Push the image to the repository and add tags.

### Configuration

```yaml
- put: my-image
  params:
    additional_tags: path/to/tags/file
```

### Parameters

- additional\_tags: *Optional*. The path to a file containing more tags.

