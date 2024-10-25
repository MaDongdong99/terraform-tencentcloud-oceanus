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
