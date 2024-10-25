
locals {
  workspace_id  = var.create_workspace ? concat(tencentcloud_oceanus_work_space.workspace.*.work_space_id, [""])[0] : var.workspace_id
  workspace_name = data.tencentcloud_oceanus_work_spaces.workspace.work_space_set_item[0].work_space_name
}

data "tencentcloud_oceanus_work_spaces" "workspace" {
  order_type = 1
  filters {
    name   = "WorkSpaceId"
    values = [local.workspace_id]
  }
}

resource "tencentcloud_oceanus_work_space" "workspace" {
  count = var.create_workspace ? 1 : 0
  work_space_name = var.work_space_name
  description     = var.description
}

locals {
  folders = merge(
    {for k, v in var.job_folders: k => merge(v, {folder_type: 0}) },
    {for k, v in var.resource_folders: k => merge(v, {folder_type: 1}) },
  )
}
resource "tencentcloud_oceanus_folder" "lv1_folders" {
  for_each = local.folders
  folder_name   = each.value.folder_name
  parent_id     = "root"
  folder_type   = each.value.folder_type
  work_space_id = local.workspace_id
}

locals {
  lv1_folder_ids = {
    for k, f in tencentcloud_oceanus_folder.lv1_folders: k => split("#", f.id)[1]
  }
  l2_folders = flatten([
    for lv1_k, lv1 in local.folders: [
      for lv2_k, lv2 in try(lv1.lv2_folders, {}): {
        k = format("%s_%s", lv1_k, lv2_k)
        folder_name = lv2.folder_name
        parent_id = local.lv1_folder_ids[lv1_k]
        folder_type = lv1.folder_type
      }
    ]
  ])
  l2_folder_map = { for folder in local.l2_folders : folder.k => folder}
}

resource "tencentcloud_oceanus_folder" "lv2_folders" {
  for_each = local.l2_folder_map
  folder_name   = each.value.folder_name
  parent_id     = each.value.parent_id
  folder_type   = each.value.folder_type
  work_space_id = local.workspace_id
}

locals {
  lv2_folder_ids = {
    for k, f in tencentcloud_oceanus_folder.lv2_folders: k => split("#", f.id)[1]
  }
}