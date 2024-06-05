# Lab 11 : OpenShift Security and RBAC

## Objective: 
Create a ServiceAccount. Define a Role named pod-reader allowing read-only access to pods in the namespace. Bind the pod-reader Role to the ServiceAccount . Get ServiceAccounttoken. Make a Comparison between role & role binding and cluster role & cluster role binding.

## PART1
## Step1: Create a ServiceAccount

- Define a ServiceAccount in a YAML file:

- Define the role in YAML file llows read-only access to pods in the namespace.

![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/6bf491ac-e3c4-4dba-80d8-fd20af61d398)


## Step2: Bind the Role to the ServiceAccount

- Define Binding role to link The Role to the Service account
  
![image](https://github.com/ramy282/iVolve_OJT/assets/60857262/c4eb21f4-0e82-4db9-bfdc-c1d73f35a371)

## Step3: Create secret file

- Define a Secret file to Store the ServiceAccount token in it.

## PART2

## Comparison between Role and RoleBinding

| Feature           | Role                                                                   | RoleBinding                                                              |
|-------------------|------------------------------------------------------------------------|--------------------------------------------------------------------------|
| **Purpose**       | Define a set of permissions (rules) within a namespace.                | Grant the permissions defined in a Role to a user or set of users.       |
| **Definition**    | Specifies what actions can be performed on which resources.            | Links a Role to a user, group, or service account, granting them the permissions specified in the Role. |
| **Scope**         | Namespace-level. Roles are limited to the namespace in which they are created. | Namespace-level. RoleBindings are limited to the namespace in which they are created. |
| **Components**    | - Rules: Consist of API groups, resources, and verbs (actions).        | - Subjects: Users, groups, or service accounts to whom the Role applies. <br> - RoleRef: Reference to the Role being granted. |
| **Example Use Cases** | - Define read-only access to pods in a specific namespace.         | - Grant a user read-only access to pods in a specific namespace using a Role. |
| **Behavior**      | Defines the permissions that are available within the namespace.       | Grants the defined permissions to the specified subjects within the namespace. |

-------------------------------------------------------------------------------------------------------------

## Comparison between ClusterRole and ClusterRoleBinding

| Feature           | ClusterRole                                                            | ClusterRoleBinding                                                       |
|-------------------|------------------------------------------------------------------------|--------------------------------------------------------------------------|
| **Purpose**       | Define a set of permissions (rules) that apply across the entire cluster. | Grant the permissions defined in a ClusterRole to a user, group, or service account at the cluster level. |
| **Definition**    | Specifies what actions can be performed on which resources across all namespaces or cluster-wide resources. | Links a ClusterRole to a user, group, or service account, granting them the permissions specified in the ClusterRole. |
| **Scope**         | Cluster-wide. ClusterRoles can be applied to any namespace and cluster-wide resources. | Cluster-wide. ClusterRoleBindings apply the ClusterRole permissions across the entire cluster. |
| **Components**    | - Rules: Consist of API groups, resources, and verbs (actions).        | - Subjects: Users, groups, or service accounts to whom the ClusterRole applies. <br> - RoleRef: Reference to the ClusterRole being granted. |
| **Example Use Cases** | - Define permissions to access cluster-wide resources like nodes or persistent volumes. | - Grant a user admin access across all namespaces using a ClusterRole.    |
| **Behavior**      | Defines the permissions that are available across all namespaces or cluster-wide resources. | Grants the defined permissions to the specified subjects across the entire cluster. |




