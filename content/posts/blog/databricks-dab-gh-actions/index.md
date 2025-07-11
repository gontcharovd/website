---
title: "Deploying Databricks Asset Bundles with GitHub Actions"
date: 2025-07-06T11:43:12+02:00
draft: true
---

Scope:
* Create DAB deploy to dev, test, and prod
* Set up GitHub Actions pipeline
* Simple notebook task
* Deploy to one (free) environment

Resources:
* Link to GitHub repo


Steps:

1. Set up GitHub Repo
2. Create DAB

---

# YAML file parametrization

We have to distinguish between variables that are used in AzureDevops Pipelines and variables that get passed further into Databricks Asset Bundles via the `databricks bundle` command using the `--var` flag.

## DAB

Define:

```YAML
variables:
  git_branch:
    description: "Git branch to use for job source code"
  service_principal:
    description: "ID of the service principal that runs the workflow"
  catalog_name:
    description: "Unity Catalog name to use for this environment"
```

And

```YAML
parameters:
  - name: environment
    type: string
  - name: databricksToken
    type: string
  - name: gitBranch
    type: string
  - name: servicePrincipal
    type: string
```

Use:

```
- task: Bash@3
  displayName: 'Validate Databricks Bundle for ${{ parameters.environment }}
  inputs:
    targetType: 'inline'
    script: |
      export DATABRICKS_TOKEN="${{ parameters.databricksToken }}"
      databricks bundle validate -t ${{ parameters.environment }} \
        --var="git_branch=${{ parameters.gitBranch }}" \
        --var="service_principal=${{ parameters.servicePrincipal }}"
```

