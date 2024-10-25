# tencentcloud Oceanus Workspace



## usage

```terraform

module "workspace" {
  source = "../../modules/workspace"

  create_workspace = true
  work_space_name = "test-workspace"

  job_folders = {
    jf1 = {
      folder_name   = "jf1"
      lv2_folders = {
        jf11 = {
          folder_name = "jf11"
        },
        jf12 = {
          folder_name = "jf12"
        }
      }
    }
  }

  resource_folders = {
    rf1 = {
      folder_name   = "rf1"
      lv2_folders = {
        rf22 = {
          folder_name = "rf22"
        }
      }
    }
  }
}

output "all" {
  value = module.workspace
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |
| <a name="requirement_tencentcloud"></a> [tencentcloud](#requirement\_tencentcloud) | >= 1.81.135 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tencentcloud"></a> [tencentcloud](#provider\_tencentcloud) | >= 1.81.135 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tencentcloud_oceanus_folder.lv1_folders](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/oceanus_folder) | resource |
| [tencentcloud_oceanus_folder.lv2_folders](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/oceanus_folder) | resource |
| [tencentcloud_oceanus_work_space.workspace](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/resources/oceanus_work_space) | resource |
| [tencentcloud_oceanus_work_spaces.workspace](https://registry.terraform.io/providers/tencentcloudstack/tencentcloud/latest/docs/data-sources/oceanus_work_spaces) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_workspace"></a> [create\_workspace](#input\_create\_workspace) | n/a | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `""` | no |
| <a name="input_job_folders"></a> [job\_folders](#input\_job\_folders) | see `tencentcloud_oceanus_folder` | `any` | `{}` | no |
| <a name="input_resource_folders"></a> [resource\_folders](#input\_resource\_folders) | see `tencentcloud_oceanus_folder` | `any` | `{}` | no |
| <a name="input_work_space_name"></a> [work\_space\_name](#input\_work\_space\_name) | n/a | `string` | `""` | no |
| <a name="input_workspace_id"></a> [workspace\_id](#input\_workspace\_id) | given id when create\_workspace is false | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lv1_folders"></a> [lv1\_folders](#output\_lv1\_folders) | n/a |
| <a name="output_lv2_folders"></a> [lv2\_folders](#output\_lv2\_folders) | n/a |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | n/a |
| <a name="output_workspace_name"></a> [workspace\_name](#output\_workspace\_name) | n/a |
