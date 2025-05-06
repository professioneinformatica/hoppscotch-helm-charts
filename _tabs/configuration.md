---
# the default layout is 'page'
icon: fas fa-info-circle
order: 1
---

## How to add a helm repository from the command line

Helm is a powerful package manager for Kubernetes that allows you to define, install, and manage Kubernetes applications. One of the key features of Helm is the ability to use repositories to store and share charts.

## Prerequisites

Before you begin, ensure you have the following:

1. **Kubernetes Cluster**: You should have access to a running Kubernetes cluster.
2. **Helm Installed**: Make sure you have Helm installed on your local machine. You can check if Helm is installed by running:
   ```bash
   helm version
   ```
   If Helm is not installed, you can follow the [official installation guide](https://helm.sh/docs/intro/install/) to set it up.

## Step 1: Add the Helm Repository

To add this Helm repository, use the `helm repo add` command followed by the name you want to assign to the repository and the repository URL. Here’s the syntax:

```bash
helm repo add <repo-name> https://github.com/professioneinformatica/hoppscotch-helm-charts
```
Replace `<repo-name>` with a name of your choice for the repository.

## Step 2: Update the Helm Repository

After adding the repository, it’s a good practice to update your local Helm chart repository cache. This ensures you have the latest information about the charts available in the repository. Run the following command:

```bash
helm repo update
```

## Step 3: Verify the Repository

To verify that the repository has been added successfully, you can list all the repositories configured in your Helm setup by running:

```bash
helm repo list
```

You should see an output similar to this:

```
NAME       URL
profinfo   https://github.com/professioneinformatica/hoppscotch-helm-charts
```

## Step 4: List all packages inside an Helm Repository

Now that you have added the repository, you can list all charts from it.

```bash
helm search repo profinfo/
```
Note: The `profinfo` is the name of the repository you added in Step 1. You can replace it with the name you chose.

## Step 5: Install a Chart from the Repository

To install a chart from this repository, you can run:

```bash
helm install my-private-hoppscotch profinfo/hoppscotch-ce
```
This command will deploy an instance of HoppScotch in your Kubernetes cluster with the release name `my-private-hoppscotch`.

## Conclusion

You have successfully added this Helm repository.

For more information on Helm, check out the [official Helm documentation](https://helm.sh/docs/).

---

Feel free to ask if you have any questions or need further assistance!