terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.21.0"
    }
  }
}

provider "docker" {}

# this is its terraform resource type (docker_image) and its name from a terraform perspective
resource "docker_image" "my_nginx_image" {
  name         = "nginx:latest"
  # set to false, the docker image is removed on terraform destroy
  # set to true, the docker image is not removed on terraform destroy
  keep_locally = false
}

# this is its terraform resource type (docker_container) and its name from a terraform perspective
resource "docker_container" "nginx" {
  image = docker_image.my_nginx_image.image_id
  # this is it's name from a docker perspective
  name  = "Lab1-intro"

  ports {
    internal = 80
    external = 8000
  }
}
