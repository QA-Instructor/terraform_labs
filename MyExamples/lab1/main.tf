terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  # Configuration options
}


# Pulls the image
resource "docker_image" "apache_web" {
  name = "httpd:latest"
}

# Create a container
resource "docker_container" "webserver" {
  image = docker_image.apache_web.image_id
  name  = "webserver"

  ports {
    internal = "80"
    external = "88"
  }
}