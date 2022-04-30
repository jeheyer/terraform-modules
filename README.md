
Network-related Terraform child modules for AWS and GCP

## Example main.tf:

```

module "instances" {
  source            = "github.com/jeheyer/terraform-modules//google_compute_instance"
}

module "unmanaged_instance_groups" {
  source            = "github.com/jeheyer/terraform-modules//google_compute_instance_groups"
}
```
