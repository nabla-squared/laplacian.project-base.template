<!-- @head-content@ -->
# laplacian/project.base-template

This template generates scripts and other basic files needed for a Laplacian based project.


*Read this in other languages*: [[日本語](README_ja.md)] [[简体中文](README_zh.md)]
<!-- @head-content@ -->

<!-- @toc@ -->
## Table of contents
1. [Overview](#overview)
1. [Usage](#usage)
1. [Development](#development)
1. [Index](#index)


<!-- @toc@ -->

<!-- @main-content@ -->
## Overview



## Usage

To apply this template module, add the following entry to your project definition.
```yaml
project:
  templates:
  - group: laplacian
    name: project.base-template
    version: 1.0.0
```

You can run the following command to see a list of resources affected by the application of this module and their contents.
```console
$ ./script/generate --dry-run

diff --color -r PROJECT_HOME/.NEXT/somewhere/something.md PROJECT_HOME/somewhere/something.md
1,26c1,10
< content: OLD CONTENT
---
> content: NEW CONTENT
```

If there is no problem, execute the following command to reflect the change.
```console
$ ./script/generate --dry-run

```


## Development



## Index


### Source code list


- [model/project/document/document.yaml](<./model/project/document/document.yaml>)
- [model/project/document/sections/index.yaml](<./model/project/document/sections/index.yaml>)
- [model/project/document/sections/usage.yaml](<./model/project/document/sections/usage.yaml>)
- [model/project/document/sections.yaml](<./model/project/document/sections.yaml>)
- [model/project/sources.yaml](<./model/project/sources.yaml>)
- [model/project.yaml](<./model/project.yaml>)
- [src/.editorconfig.hbs](<./src/.editorconfig.hbs>)
- [src/.gitattributes.hbs](<./src/.gitattributes.hbs>)
- [src/.gitignore.hbs](<./src/.gitignore.hbs>)
- [src/scripts/{each project.subprojects as subproject}{hyphen subproject.group}-{hyphen subproject.name}/publish-local.sh.hbs](<./src/scripts/{each project.subprojects as subproject}{hyphen subproject.group}-{hyphen subproject.name}/publish-local.sh.hbs>)
- [src/scripts/{each project.subprojects as subproject}{hyphen subproject.group}-{hyphen subproject.name}/update-project.sh.hbs](<./src/scripts/{each project.subprojects as subproject}{hyphen subproject.group}-{hyphen subproject.name}/update-project.sh.hbs>)
- [src/scripts/generate.sh.hbs](<./src/scripts/generate.sh.hbs>)
- [src/scripts/{if project.subprojects}git-status-subprojects.sh.hbs](<./src/scripts/{if project.subprojects}git-status-subprojects.sh.hbs>)
- [src/scripts/{if project.subprojects}update-subprojects.sh.hbs](<./src/scripts/{if project.subprojects}update-subprojects.sh.hbs>)
- [src/scripts/laplacian-generate.sh](<./src/scripts/laplacian-generate.sh>)
- [src/scripts/laplacian/gradlew](<./src/scripts/laplacian/gradlew>)
- [src/scripts/laplacian/gradle/wrapper/gradle-wrapper.jar](<./src/scripts/laplacian/gradle/wrapper/gradle-wrapper.jar>)
- [src/scripts/laplacian/gradle/wrapper/gradle-wrapper.properties](<./src/scripts/laplacian/gradle/wrapper/gradle-wrapper.properties>)
- [src/scripts/{unless (eq project.role 'generator')}publish-local.sh.hbs](<./src/scripts/{unless (eq project.role 'generator')}publish-local.sh.hbs>)
- [src/scripts/update-project.sh](<./src/scripts/update-project.sh>)



<!-- @main-content@ -->