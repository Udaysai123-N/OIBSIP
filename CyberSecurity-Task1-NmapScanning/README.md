# Task 1 - Local Nmap Scanning

## Objective
Practice TCP port scanning and service detection on my own Kali Linux virtual machine.

## Tools
- Kali Linux in VirtualBox
- Nmap 7.99
- Python HTTP server

## Scope
Only localhost (127.0.0.1) was scanned.

## Lab Setup
Created lab_web/index.html and started the server:

    python3 -m http.server 8000 --bind 127.0.0.1 --directory lab_web

Opened http://127.0.0.1:8000 in Firefox to verify the webpage.

## Scan Commands

### Single Port Scan
    nmap -sT -p 8000 127.0.0.1 -oN scan_port8000.txt

### Service Version Detection
    nmap -sT -sV -p 8000 127.0.0.1 -oN scan_service_version.txt

### Multiple Port Scan
    nmap -sT -p 22,80,443,8000 127.0.0.1 -oN scan_multiple_ports.txt

## Results
- Port 22/TCP: closed
- Port 80/TCP: closed
- Port 443/TCP: closed
- Port 8000/TCP: open
- Detected service: HTTP
- Detected server: SimpleHTTPServer 0.6 (Python 3.13.12)

## Evidence
- scan_port8000.txt
- scan_service_version.txt
- scan_multiple_ports.txt
- screenshots/udayasai_Task1_servicescan.png
- screenshots/udayasai_Task1_Multipleports.png

## Learning
- -sT performs a TCP connect scan.
- -sV detects service versions.
- -p selects ports.
- -oN saves results as normal text.

An open port means a service accepts connections.
An open port alone does not prove a vulnerability.
These results apply only to the tested localhost ports.
