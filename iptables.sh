#!bin/bash

iptables -L
#Configuracion para direccionar hacia el firewall lo que se encuentra fuera de red
route add default gw 192.168.0.25 eth0
route -n

#En el firewall:
cat /proc/sys/net/ipv4/ip_forward
#Si esta a 0 se pone a 1 para permitir el enrutamiento: 
echo 1 > /proc/sys/net/ipv4/ip_forward

#Denegar acceso desde una red a otra:
iptables -P FORDWARD DROP #esto hará que todos los reenvios (que pasen por el firewall) se tiren

#Solo se prohibe el trafico a una máquina
iptables -P FORDWARD ACCEPT
iptables -A FORDWARD -d 192.168.2.8 -j DROP

#Se acepta la navegacion web pero no SSH
iptables -A FORDWARD -p tcp --dport 80 -j ACCEPT 
#Para que se llegue a aplicar esta regla hay que reorganizar la secuencia ya que
# si va por encima la mas restrictiva nunca se aplicara 
iptables -D FORDWARD 1
iptables -A FORDWARD -j DROP -d 192.168.2.8

#Tener acceso al servidor ssh pero no a otro servicio desde el firewall
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -P OUTPUT DROP

#Cuando una maquina se dirige al exterior se enmascara su direccion origen (SNAT)
iptables -F #Para permitir todo nuevamente
iptables -A POSTROUTING -t nat -o eth1 -j SNAT  --to-source 192.168.2.8
iptables -t nat --list #A partir de ahora la conexion tendra la ip del firewall

