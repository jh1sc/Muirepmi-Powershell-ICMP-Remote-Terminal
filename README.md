# Muirepmi ⚜️
## Description 💻
These scripts are for creating a command-line interface for sending and receiving messages between computers using the Internet Control Message Protocol (ICMP) and PowerShell SSH.

The recieve script, sets up a raw ICMP socket on the local machine and binds it to the local IP address. This creates a new raw socket, which is a type of network socket that allows the user to directly access the underlying transport protocol (in this case, ICMP). The socket is then bound to the local IP address, which means that it will only receive packets that are sent to that IP address. 

The Send script, the user is prompted to enter a string of text, which is then converted to ASCII bytes and sent one by one as the payload of ICMP ping packets to a specified IP address that is chosen by the host. It is worth noting that this script is using the ping command to send ICMP packets, which is generally not a recommended way to send raw ICMP packets. The ping command is intended for testing network connectivity, and is not designed to be used as a general-purpose packet-sending tool. Additionally, using raw sockets to send and receive ICMP packets may not be allowed on all networks.

![hello](https://img.shields.io/badge/Lab-hello-blue)



