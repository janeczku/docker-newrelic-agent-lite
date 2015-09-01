# New Relic server agent (lite edition)

This is a very small busybox based image providing the New Relic server agent inside a container.    
Logging is redirected to stdout and can be viewed using the `docker logs` command.

## Usage

```
docker run -d \
--privileged=true --name newrelic-agent \
--pid=host \
--net=host \
-v /sys:/sys \
-v /dev:/dev \
-v /var/run/docker.sock:/var/run/docker.sock \
-e NRSYSMOND_license_key=<LICENSE> \
janeczku/newrelic-agent:latest
```

replacing `<LICENSE>` with the 40 character license found in your account settings

## ENV variables

**NRSYSMOND_license_key**  *Required*    
Default: ` `   
A valid 40-character license key is required.

**NRSYSMOND_hostname**    
Default: ` `     
Sets the hostname of the server as it appears in New Relic.

**NRSYSMOND_labels**    
Default: ` `     
A dictionary of label names and values for categories that will be applied to the data sent from this agent.
For example: `Server:One;Data Center:Primary;`

**NRSYSMOND_loglevel**     
Default: `info`     
Sets the level of detail for messages sent to the log file:
* error
* warning
* info
* verbose
* debug
* verbosedebug

### Using environment variables
You can pass environment variables using the docker run command's -e flag. 

For example: 
 
```sh
-e NRSYSMOND_loglevel=debug
```
