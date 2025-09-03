**ARCHITECTURE OVERVIEW**


The main goal is to create a Virtual Machine (VM) in Azure with a minimal container environment, deploy a Keycloak authentication server with an attached PostgreSQL database, and host a static web page whose access is controlled by Keycloak.

**Technologies used**

- Terraform
- Azure
- Ansible
- Docker
- Nginx
- GitHub


**Architecture diagram**

           +--------------------------+
           |      Public Internet     |
           |--------------------------|
           |    Ports: 22, 80, 443    |
           +-----------+--------------+
                       |
                       v
              +--------------------+
              |      Public IP     |
              +--------------------+
                       |
                       v
              +--------------------+
              |  Network Interface |
              +--------------------+
                       |
                       v
              +--------------------+
              |         VM         |
              |   Ubuntu 20.04 LTS |
              +--------------------+
                       |
            +----------+------------+
            |                       |
    +-----------+  +----------+  +------------+
    | PostgreSQL|  | Keycloak |  |   Nginx    |
    | Container |  | Container|  | Container  |
    +-----------+  +----------+  +------------+
                       ^
                       |
                 Internal Subnet
                  (10.0.1.0/24)


1. External Access
    * Users access the system through the public internet.
    * Only ports 22 (SSH), 80 (HTTP), 443(HTTPS).

2. Public IP and Network Interface
    * The VM is assigned a static public IP, enabling external access.
    * The network interface connects the VM to both the public IP and the internal Azure virtual network.

3. Virtual Machine (VM)
    * A Linux Ubuntu 20.04 LTS VM hosts all containers.
    * The VM communicates with the internal subnet (10.0.1.0/24) where all containers reside.
    * Docker runs on the VM to provide the container environment.

4. Containers inside the VM
    * PostgreSQL Container: Stores data securely.
    * Nginx Container: Acts as a reverse proxy forwarding secure traffic to Keycloak (http://keycloak:8080).
    * Keycloak Container: Authentication server, integrated with PostgreSQL

Access:

DNS: https://hylastixproject.ddns.net

User: admin

Password: admin123