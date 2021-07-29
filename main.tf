resource "google_compute_instance" "leader_node" {
  #count        = 1
  name         = "${var.cluster_name}-1"
  machine_type = var.instance_type
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = var.qumulo_image
      type  = "pd-ssd"
    }
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.leader_node-ssd-
    content {
      source      = attached_disk.value.self_link
      device_name = split("-", attached_disk.value.name)[2]
    }
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.leader_node-hdd-
    content {
      source      = attached_disk.value.self_link
      device_name = split("-", attached_disk.value.name)[2]
    }
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }

  network_interface {
    network = "default"
  }

  metadata = {
    block-project-ssh-keys = false
    user-data              = jsonencode({ "node_ips" = google_compute_instance.qumulo-node-[*].network_interface.0.network_ip, "cluster_name" = "${var.cluster_name}", "spec_info" = { "slot_specs" = [{ "drive_bay" = "/dev/disk/by-id/google-1", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-2", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-3", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-4", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-5", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-6", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-7", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-8", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-9", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-10", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-11", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-12", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-13", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-14", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-15", "disk_role" = "backing", "disk_size" = 536870912000 }] } })
    qumulo_user_password   = "${var.user_password}"
  }

}

resource "google_compute_instance" "qumulo-node-" {
  count        = var.node_count - 1
  name         = "${var.cluster_name}-${count.index + 2}"
  machine_type = var.instance_type
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = var.qumulo_image
      type  = "pd-ssd"
    }
  }

  dynamic "attached_disk" {
    for_each = flatten([
      for ssd_number in range(1, 6) : [
        google_compute_disk.node-ssd-["${var.cluster_name}-${count.index + 2}-${ssd_number}"]

      ]
      ]
    )
    content {
      source      = attached_disk.value.self_link
      device_name = split("-", attached_disk.value.name)[2]
    }
  }

  dynamic "attached_disk" {
    for_each = flatten([
      for hdd_number in range(6, 16) : [
        google_compute_disk.node-hdd-["${var.cluster_name}-${count.index + 2}-${hdd_number}"]

      ]
      ]
    )
    content {
      source      = attached_disk.value.self_link
      device_name = split("-", attached_disk.value.name)[2]
    }
  }

  lifecycle {
    ignore_changes = [attached_disk]
  }

  network_interface {
    network = "default"
  }

  metadata = {
    block-project-ssh-keys = false
    user-data              = jsonencode({ "spec_info" = { "slot_specs" = [{ "drive_bay" = "/dev/disk/by-id/google-1", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-2", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-3", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-4", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-5", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-6", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-7", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-8", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-9", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-10", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-11", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-12", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-13", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-14", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-15", "disk_role" = "backing", "disk_size" = 536870912000 }] } })
    qumulo_user_password   = "${var.user_password}"
  }
}

resource "google_compute_disk" "leader_node-ssd-" {
  count = var.ssd_count
  name  = "${var.cluster_name}-1-${count.index + 1}"
  type  = "pd-ssd"
  zone  = var.gcp_zone
  size  = "100"
}

resource "google_compute_disk" "leader_node-hdd-" {
  count = var.hdd_count
  name  = "${var.cluster_name}-1-${count.index + 6}"
  type  = "pd-standard"
  zone  = var.gcp_zone
  size  = "500"
}

resource "google_compute_disk" "node-ssd-" {
  for_each = toset(local.node_ssd_name)
  name     = each.key
  type     = "pd-ssd"
  zone     = var.gcp_zone
  size     = "100"
}

resource "google_compute_disk" "node-hdd-" {
  for_each = toset(local.node_hdd_name)
  name     = each.key
  type     = "pd-standard"
  zone     = var.gcp_zone
  size     = "500"
}

locals {
  node_ssd_name = flatten([
    for node_number in range(2, var.node_count + 1) : [
      for ssd_number in range(0, var.ssd_count) :
      "${var.cluster_name}-${node_number}-${ssd_number + 1}"
    ]
  ])

  node_hdd_name = flatten([
    for node_number in range(2, var.node_count + 1) : [
      for hdd_number in range(0, var.hdd_count) :
      "${var.cluster_name}-${node_number}-${hdd_number + 6}"
    ]
  ])
}
