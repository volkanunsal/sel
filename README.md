# Docker Selenium Demo

This is a minimal reproduction of an issue we're having in Selenium containers.

# Getting Started

## Using Docker Compose

```
docker-compose -f compose.amd64.yml run integration
```

## Using Earthly

* Install [Earthly](https://earthly.dev/)
* Run 

```
earthly -P -i --use-inline-cache +integration
```

# Error messages

```
+integration | [remote server] sun.reflect.NativeConstructorAccessorImpl(NativeConstructorAccessorImpl.java):-2:in `newInstance0': unknown error: Chrome failed to start: crashed. (Selenium::WebDriver::Error::UnknownError)
        +integration |   (unknown error: DevToolsActivePort file doesn't exist)
        +integration |   (The process started from chrome location /usr/bin/google-chrome is no longer running, so ChromeDriver is assuming that Chrome has crashed.)
        +integration | Build info: version: '3.141.59', revision: 'e82be7d358', time: '2018-11-14T08:25:53'
        +integration | System info: host: '131d48748013', ip: '172.21.0.2', os.name: 'Linux', os.arch: 'amd64', os.version: '5.10.25-linuxkit', java.version: '1.8.0_292'
        +integration | Driver info: driver.version: unknown
```
