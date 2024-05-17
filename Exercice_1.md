# Exercice 1

## Q.1.1 Sans changer les adresses IPv4 des 2 machines, montre et explique le résultat d'un ping IPv4 du serveur vers le client.

Le ping de la machine server vers le client échoue car les deux machines ne sont pas sur le même réseau

![](https://github.com/Alex-le-basque/Checkpoint_2/blob/main/Ressources/ping_server_client_1.png?raw=true)

![](https://github.com/Alex-le-basque/Checkpoint_2/blob/main/Ressources/Capture%20d'%C3%A9cran%202024-05-17%20112054.png?raw=true)

## Q.1.2 Montre et explique le résultat d'un ping du serveur vers le client avec le nom des machines.

![](https://github.com/Alex-le-basque/Checkpoint_2/blob/main/Ressources/Capture%20d'%C3%A9cran%202024-05-17%20112547.png?raw=true)

Le ping avec le nom de la machine fonctionne gràce à la configuration DNS

## Q.1.3

Après la désactivation de l'IPV6 tout fonctionne sans faire de changement

![](https://github.com/Alex-le-basque/Checkpoint_2/blob/main/Ressources/Capture%20d'%C3%A9cran%202024-05-17%20113006.png?raw=true
)

## Q.1.4 Change et montre les configurations réseaux sur le client et/ou sur le serveur pour mettre en place le DHCP.

![](https://github.com/Alex-le-basque/Checkpoint_2/blob/main/Ressources/Capture%20d'%C3%A9cran%202024-05-17%20113708.png?raw=true)

## Q.1.5 Explique pourquoi le client ne récupère pas la 1ère adresse disponible sur cette plage.

Il récupere la premiere disponible pour lui car la 172.16.10.1 est exclu de la distribution

![](https://github.com/Alex-le-basque/Checkpoint_2/blob/main/Ressources/Capture%20d'%C3%A9cran%202024-05-17%20114003.png?raw=true)

## Q.1.6 Fais une modification sur le DHCP pour que le client ai l'adresse IP 172.16.10.15.

![](https://github.com/Alex-le-basque/Checkpoint_2/blob/main/Ressources/Capture%20d'%C3%A9cran%202024-05-17%20114558.png?raw=true)

## Q.1.7 Au vu de tes manipulations, explique l'intérêt de passer ce réseau en IPv6 ?

Passer en IPV6 permet de l'auto-configuration des addresse IP à partir se don adresse MAC

## Q.1.8 Est-ce que dans ce cas le serveur DHCP est obsolète ?
Quelle modification peut-on faire sur le serveur DHCP pour qu'il reste actif et qu'il te permette de gérer les adresses IPv6 ?
