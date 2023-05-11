# Containerized your laravel application with laradok

This is a Laravel application containerized with PHP8.1, Nginx, MySQL, Worker, Mailhog, and Redis. It can be used as a base setup to quickly get started with Laravel development.

## Prerequisites

- [Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04) 
- [Docker Compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)

## Installation

To install the application, follow the steps below:

1. Clone the repository:

   ```
   git clone https://github.com/azonedev/laradok.git
   ```

2. Navigate to the cloned directory:

   ```
   cd laradok
   ```

3. Run the installation script:

   ```
   sh install.sh
   ```
   or 
   ```
   ./install.sh
   ```

The installation script checks for the existence of `docker-compose.yml` and `.env` files, and copies them from the example files if they do not exist. It also clones the latest version of Laravel, sets file permissions, installs Laravel dependencies, generates an application key, and restarts the containers.

## Configuration

Before running the installation script, review the `.env` file to set the environment variables. You can use `nano .env` to open the file for editing.

## Usage

To start the containers, run the following command:

```
docker-compose up -d
```

The containers can be accessed at:

- Nginx: `http://localhost:8081`
- Mailhog: `http://localhost:8025`

To stop the containers, run the following command:

```
docker-compose down
```

## Services

The following services are included in the `docker-compose.yml` file:

- Nginx: serves the Laravel application
- PHP: runs the Laravel application
- MySQL: stores the application data
- Mailhog: checking & testing the application emails on locally
- Redis: stores application cache and sessions
- Worker: managing background jobs 

## Volumes

The `./data` directory is used to store persistent data for the MySQL and Redis services.

## Contributing

Feel free to contribute to this repository by creating issues and pull requests.
