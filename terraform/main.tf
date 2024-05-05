resource "yandex_vpc_network" "vpc" {
  name = "yc-web-vpc"
}

# VPC Subnet within the VPC Network
resource "yandex_vpc_subnet" "subnet" {
  name           = "yc-web-subnet"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.vpc.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

# Virtual Machine instances
resource "yandex_compute_instance" "web" {
  count = 2

  name = "yc-web-server-${count.index}"
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd82vchjp2kdjiuam29k"
      size     = 15
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.admin_ssh_key}"
  }
}

resource "datadog_monitor" "healthcheck" {
  name    = "Healthcheck monitor"
  type    = "service check"
  query   = "\"http.can_connect\".over(\"instance:datadog_health_check\").by(\"host\",\"instance\",\"url\").last(4).count_by_status()"
  message = "{{host.name}} not available"
}
