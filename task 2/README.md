# Scenario
|The Issue |How to confirm |Solution |
|----------|---------------|---------|
|The DNS Server is configured uncorrectly |using command `cat /etc/reslov.conf` |Edit file `/etc/reslov.conf` using command `sudo vim /etc/reslov.conf` and configure the DNS server correctly |
|The DNS Server is __DOWN__ |If the result of the command `dig internal.example.com` is `Time out` |Restart the server and check the network (caples, switches & routers) |
|The DNS Record is missing | If the result of the command `dig internal.example.com` is nothing |Add the correct A record or CNAME on the DNS Server | 
|The Server IP Address has been changed | Use command `ip addr show` to check the ip address |Update the record in the DNS Server |
|Server not listening in the desired ports | command `ss -tulnp` doesn't show ports 80 ro 443 |restart the service(nginx|apache) `sudo systemctl restart nginx`|
|Firewall is blocking the traffic|the command `curl internal.example.com` fails to reach the server after checking the that the service is listening, and the DNS is configured correctly |Update the firewall rules `sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT` |
|The HTTPS misconfig|the result of the command `curl -v https://internal.example.com` is certificate error |Renew or install correct SSL cert and configure web server properly |
 
