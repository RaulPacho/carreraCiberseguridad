
#El MacFlooding es llenar la tabla de mac en un switch ya que al llenarse, el switch lanzará un broadcast por petición, en caso de que la mac ya se encuentre
#en la tabla se quedara así que hay que hay que vaciarla usando:
clear mac-address vlan 1
#Despues usar macof, como no dispongo de un switch lso ejemplos son teoricos
macof [-i interface] [-s src] [-d dst] [-e tha] [-x sport] [-y dport] [-n times]
#Lo siguiente sería hacer que Wireshark quede a la escucha de paquetes.
#Para evitarlo se podría poner una respuesta de mac por puerto.