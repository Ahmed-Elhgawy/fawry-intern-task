# Scenario
|The Issue |How to confirm |Solution |
|----------|---------------|---------|
|DNS server is misconfigured |Use the command `cat /etc/resolv.conf` [PNG-1](./issue1.png) |Edit the file `/etc/resolv.conf` using `sudo vim /etc/resolv.conf` and configure the correct DNS server |
|DNS server is down |If the result of the command `dig internal.example.com` is a __timeout__ |Restart the DNS server and check the network (cables, switches, and routers |
|DNS record is missing |If the result of the command `dig internal.example.com` returns __no answer__ [PNG-2](./issue2.png)|Add the correct A or CNAME record to the DNS server | 
|Server IP address has changed |Use the command `ip addr show` to check the IP address [PNG-3](./issue3.png)|Update the corresponding record in the DNS server |
|Server not listening on required ports |Command `ss -tulnp` doesn't show ports 80 or 443 [PNG-4](./issue4.png)|Restart the web service (e.g., nginx) `sudo systemctl restart nginx` |
|Firewall is blocking the traffic |The command `curl internal.example.com` fails to reach the server even after confirming the service is running and DNS is correct [PNG-5](./issue5.png)|Update the firewall rules `sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT` |
|HTTPS misconfiguration |The command `curl -v https://internal.example.com` returns a __certificate error__ |Renew or install a valid SSL certificate and configure the web server properly |
 
### Bouns
By default, the server checks its local file at `/etc/hosts` before querying the DNS server to resolve a web server's URL. This default behavior can be changed by editing the `/etc/nsswitch.conf` file. \
[The Contant of `/etc/hosts` file](./Bouns1.png)
[The contant of `/etc/nsswitch.conf` file](./Bouns2.png)
