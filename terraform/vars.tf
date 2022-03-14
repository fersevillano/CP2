variable "location" {
  type    = string
  description = "Región donde crearemos la infraestructura"
  default = "Norway East"
}

variable "vm_size" {
  type    = string
  description = "Tamaño de la máquina virtual, en este caso 3.5GB de ram y 1 CPU"
  default = "Standard_D2s_v3" 
}

variable "vms" {
  description = "Máquinas virtuales que se van a crear"
  type = list(string)
  default = ["master", "worker01","worker02","nfs"]
}