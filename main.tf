

resource "google_compute_instance" "qumulo-node-1" {
  #count        = 1
  name         = "berat-1"
  machine_type = "n1-standard-8"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/qumulo-public/global/images/qumulo-3-2-0-1-hybrid-5tb"
      type  = "pd-ssd"
    }
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.node-1-ssd-
    content {
      source      = attached_disk.value.self_link
      device_name = split("-", attached_disk.value.name)[1]
    }
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.node-1-hdd-
    content {
      source      = attached_disk.value.self_link
      device_name = split("-", attached_disk.value.name)[1]
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
    user-data              = jsonencode({ "node_ips" = [google_compute_instance.qumulo-node-2.network_interface.0.network_ip, google_compute_instance.qumulo-node-3.network_interface.0.network_ip, google_compute_instance.qumulo-node-4.network_interface.0.network_ip], "cluster_name" = "QUMULO-B", "spec_info" = { "slot_specs" = [{ "drive_bay" = "/dev/disk/by-id/google-1", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-2", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-3", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-4", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-5", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-6", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-7", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-8", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-9", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-10", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-11", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-12", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-13", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-14", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-15", "disk_role" = "backing", "disk_size" = 536870912000 }] } })
    qumulo_user_password   = "Cq1iQRW3Dr"
  }
}

resource "google_compute_instance" "qumulo-node-2" {
  #count        = 1
  name         = "berat-2"
  machine_type = "n1-standard-8"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/qumulo-public/global/images/qumulo-3-2-0-1-hybrid-5tb"
      type  = "pd-ssd"
    }
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.node-2-ssd-
    content {
      source      = attached_disk.value.self_link
      device_name = split("-", attached_disk.value.name)[1]
    }
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.node-2-hdd-
    content {
      source      = attached_disk.value.self_link
      device_name = split("-", attached_disk.value.name)[1]
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
    user-data              = jsonencode({"spec_info" = { "slot_specs" = [{ "drive_bay" = "/dev/disk/by-id/google-1", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-2", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-3", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-4", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-5", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-6", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-7", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-8", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-9", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-10", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-11", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-12", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-13", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-14", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-15", "disk_role" = "backing", "disk_size" = 536870912000 }] } })
    qumulo_user_password   = "Cq1iQRW3Dr"
  }
}

resource "google_compute_instance" "qumulo-node-3" {
  #count        = 1
  name         = "berat-3"
  machine_type = "n1-standard-8"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/qumulo-public/global/images/qumulo-3-2-0-1-hybrid-5tb"
      type  = "pd-ssd"
    }
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.node-3-ssd-
    content {
      source      = attached_disk.value.self_link
      device_name = split("-", attached_disk.value.name)[1]
    }
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.node-3-hdd-
    content {
      source      = attached_disk.value.self_link
      device_name = split("-", attached_disk.value.name)[1]
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
    user-data              = jsonencode({"spec_info" = { "slot_specs" = [{ "drive_bay" = "/dev/disk/by-id/google-1", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-2", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-3", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-4", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-5", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-6", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-7", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-8", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-9", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-10", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-11", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-12", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-13", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-14", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-15", "disk_role" = "backing", "disk_size" = 536870912000 }] } })
    qumulo_user_password   = "Cq1iQRW3Dr"
  }
}

resource "google_compute_instance" "qumulo-node-4" {
  #count        = 1
  name         = "berat-4"
  machine_type = "n1-standard-8"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "https://www.googleapis.com/compute/v1/projects/qumulo-public/global/images/qumulo-3-2-0-1-hybrid-5tb"
      type  = "pd-ssd"
    }
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.node-4-ssd-
    content {
      source      = attached_disk.value.self_link
      device_name = split("-", attached_disk.value.name)[1]
    }
  }

  dynamic "attached_disk" {
    for_each = google_compute_disk.node-4-hdd-
    content {
      source      = attached_disk.value.self_link
      device_name = split("-", attached_disk.value.name)[1]
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
    user-data              = jsonencode({"spec_info" = { "slot_specs" = [{ "drive_bay" = "/dev/disk/by-id/google-1", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-2", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-3", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-4", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-5", "disk_role" = "working", "disk_size" = 107374182400 }, { "drive_bay" = "/dev/disk/by-id/google-6", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-7", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-8", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-9", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-10", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-11", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-12", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-13", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-14", "disk_role" = "backing", "disk_size" = 536870912000 }, { "drive_bay" = "/dev/disk/by-id/google-15", "disk_role" = "backing", "disk_size" = 536870912000 }] } })
    qumulo_user_password   = "Cq1iQRW3Dr"
  }
}


resource "google_compute_disk" "node-1-ssd-" {
  count = 5
  name  = "node1-${count.index + 1}"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  size  = "100"
}

resource "google_compute_disk" "node-1-hdd-" {
  count = 10
  name  = "node1-${count.index + 6}"
  type  = "pd-standard"
  zone  = "us-central1-a"
  size  = "500"
}

resource "google_compute_disk" "node-2-ssd-" {
  count = 5
  name  = "node2-${count.index + 1}"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  size  = "100"
}

resource "google_compute_disk" "node-2-hdd-" {
  count = 10
  name  = "node2-${count.index + 6}"
  type  = "pd-standard"
  zone  = "us-central1-a"
  size  = "500"
}

resource "google_compute_disk" "node-3-ssd-" {
  count = 5
  name  = "node3-${count.index + 1}"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  size  = "100"
}

resource "google_compute_disk" "node-3-hdd-" {
  count = 10
  name  = "node3-${count.index + 6}"
  type  = "pd-standard"
  zone  = "us-central1-a"
  size  = "500"
}

resource "google_compute_disk" "node-4-ssd-" {
  count = 5
  name  = "node4-${count.index + 1}"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  size  = "100"
}

resource "google_compute_disk" "node-4-hdd-" {
  count = 10
  name  = "node4-${count.index + 6}"
  type  = "pd-standard"
  zone  = "us-central1-a"
  size  = "500"
}

