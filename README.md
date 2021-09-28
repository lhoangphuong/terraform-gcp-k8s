# terraform-gcp-k8s
## _This project using terraform to provision GCP resources_

[![N|Solid](https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/Terraform_Logo.svg/1280px-Terraform_Logo.svg.png)](https://www.terraform.io/)

![terraform-ci workflow](https://github.com/lhoangphuong/terraform-gcp-k8s/actions/workflows/terraform-ci.yml/badge.svg)
![terraform-deploy workflow](https://github.com/lhoangphuong/terraform-gcp-k8s/actions/workflows/terraform-deploy.yml/badge.svg)
![terraform-remove workflow](https://github.com/lhoangphuong/terraform-gcp-k8s/actions/workflows/terraform-remove.yml/badge.svg)

- GCP is a public cloud platform, which provide resources for our K8S cluster
- Terraform is an open-source infrastructure as code tool
- Kubernetes (k8s) often refer as a container orchestration tool. It is a portable, extensible, open-source platform for managing containerized workloads and services. 
✨ When use together, magic happen ✨

## Workflow
```sh
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

## Process
- On develop branch: run all workflow exclude **terraform apply**
- Make a PR
- Merge develop to master
- On master branch: run all workflow inculde **terraform apply**


## License

MIT

**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
   [PlMe]: <https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>
   [PlGa]: <https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md>
