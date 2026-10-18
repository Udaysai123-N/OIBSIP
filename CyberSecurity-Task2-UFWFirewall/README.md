# Task 2: Firewall Configuration Using UFW

## Objective
Configure a firewall in my Kali Linux virtual machine and test
whether it blocks incoming HTTP connections.

## Tools Used
- Kali Linux
- Oracle VirtualBox
- UFW (Uncomplicated Firewall)
- Python HTTP server
- Windows Chrome browser
- curl

## Firewall Rules
| Port | Service | Incoming action |
|------|---------|-----------------|
| 22/TCP | SSH | Allow |
| 80/TCP | HTTP | Deny |
| 443/TCP | HTTPS | Allow |
| 23/TCP | Telnet | Deny |

Default policy: deny incoming and allow outgoing traffic.
Allowing a port does not install or start its service.

## Test Setup
A Python HTTP server served my lab_web folder on Kali port 80.
VirtualBox NAT port forwarding connected Windows
127.0.0.1:8080 to Kali port 80.

The forwarding rule used:
- Protocol: TCP
- Host IP: 127.0.0.1
- Host port: 8080
- Guest IP: blank
- Guest port: 80

## Observed Results
1. Before enabling UFW, the test page loaded in Windows Chrome.
2. After enabling UFW, Chrome displayed ERR_CONNECTION_RESET.
3. A local curl request inside Kali still returned the test page.
4. UFW status showed the firewall active with all four rules.

These results support that incoming HTTP access was blocked
while the web server remained running.

Local loopback access is handled separately by UFW.
The local curl check verifies server availability; it is not
a test of the incoming HTTP deny rule.

SSH, HTTPS and Telnet rules were checked in the configuration.
Their service connectivity was not tested.

## Files
- ufw_configuration.sh: firewall configuration commands
- ufw_status.txt: saved firewall status
- lab_web/index.html: test webpage
- screenshots/: evidence of configuration and testing

## Run the Configuration Script
Use this script inside the intended Kali lab VM.
UFW must already be installed.

    chmod +x ufw_configuration.sh
    ./ufw_configuration.sh

The script changes firewall rules and enables UFW.
It preserves any existing rules.

## Learning
I practiced adding allow and deny rules, enabling UFW,
checking its status, and comparing access before and after
enabling the firewall.

## Scope
All testing used my own Windows computer and Kali virtual machine.
