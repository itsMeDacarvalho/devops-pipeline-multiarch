# Devops Pipeline Multiarch
<img src="https://avatars.slack-edge.com/2019-01-17/528389819366_e7a0672f0480b3e98d21_512.png" align="right"
     alt="Size Limit logo by Anton Lovchikov" width="130" height="150">
Devops pipeline multiarch is a script that once added to a project to be consumed by an azure pipeline allows container images to be created for architectures that are not natively supported by the platform.
* **"Almost" zero touch solution** to generate multi architecture docker images in azure devops pipelines.
* Tries to abstract every configuration from the user in order to **facilitate the integration** in every project
* **Removes the pain of setting up new intermediary images** for new project needs.

# Instructions
As soon as you have your ``azure-pipelines.yml`` in place for your project, it is just a matter of adding a couple of lines. Simple as...

1. Please add an extension to your ``Dockerfile`` that describes your architecture. Check the [supported architectures](#supported-architectures).
2. Clone this repo and copy the ``scripts/`` folder to the root of your project repository.
3. Copy the following code snippet as first task in your ``azure-pipelines.yml``:
```yaml
# --------- MULTI-ARCH-SETUP ----------
- task: Bash@3
  displayName: Setting QEMU from Dockerfile extension
  inputs:
    targetType: 'filePath'
    filePath: $(System.DefaultWorkingDirectory)/scripts/multi_arch.sh
# ----- * --------- * --------- * -----  
```


# Supported Architectures
| Architecture   | Extension      | Supported            |
|----------------|:--------------:|:--------------------:|
| arm32v7        |``.arm32v7``    |   :heavy_check_mark: |
| arm64v8        |``.arm64v8``    |   :heavy_check_mark: |
| riscv32        |``.riscv32``    |   :heavy_check_mark: |
| riscv64        |``.riscv64``    |   :heavy_check_mark: |
| mips           |``.mips``       |   :heavy_check_mark: |


# Contributing
> This project is just a simple solution, but a lot of other things can be done here! :facepunch:
1. Clone repo and create a new branch.
2. Make changes and test.
3. Submit **Pull Request** with comprehensive description of changes.
