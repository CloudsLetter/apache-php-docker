#  how to build this image
1. fork this repo or use [project builder](https://github.com/CloudsLetter/apache-php-docker/generate) click project builder
2. github home page  -> repo -> settings -> secrets ,click new repository secrets

|  key   | value  |
|  ----  | ----  |
| REGISTRY_LABEL  | Registry address(docker.io,gcr.io,quay.io,...) |
| REGISTRY_IMAGE  | owner/imagename |
| REGISTRY_USERNAME  | registry username |
| REGISTRY_IMAGE  | registry passwowrd |

3. -> actions find out build-apache-php workflow  click run workflow , time for a cup of tea ,zzzz
