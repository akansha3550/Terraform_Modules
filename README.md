# Terraform_Modules

## What is a Terraform Module?
A Terraform module is a collection of Terraform configuration files that can be reused and shared across different projects. Modules help organize infrastructure code, making it easier to manage, maintain, and scale.
Terraform modules act like functions in programming—they allow you to reuse the same infrastructure code multiple times without rewriting it.

## Why Use Terraform Modules?
**Reusability** – Write the module once and use it in different environments (dev, staging, production).

**Maintainability** – Organizes code into logical units, making it easier to update.

**Scalability** – Modules make it easier to manage large infrastructures.

**Consistency** – Ensures all environments follow the same infrastructure standards.

**Collaboration** – Teams can share and version control modules.

## Types of Terraform Modules
Terraform modules can be categorized into three main types:

1. Root Module: The directory where terraform apply is executed. This module calls other modules.

2. Child Modules: Custom modules stored in the project or externally in a remote repository.

3. Official/Public Modules: Pre-built modules from the Terraform Registry (registry.terraform.io).

