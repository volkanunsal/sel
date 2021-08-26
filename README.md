# Docker Selenium Demo

This is a minimal reproduction of an issue we're having in Selenium containers.

# Getting Started

## Using Docker Compose

```
./run_docker.sh
```

## Using Earthly

* Install [Earthly](https://earthly.dev/)
* Run 

```
./run_earthly.sh
```

# Error messages

```
#0 0x55e58010fa63 <unknown>: unknown error: net::ERR_CONNECTION_REFUSED (Selenium::WebDriver::Error::UnknownError)
  (Session info: headless chrome=92.0.4515.107)
```
