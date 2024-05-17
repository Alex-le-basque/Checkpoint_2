# Exercice 3 : Vérification d'une infrastructure réseau

## Q.3.1 Quel est le matériel réseau A ?
Quel est son rôle sur ce schéma vis-à-vis des ordinateurs ?

  Le matériel A est un switch qui agit sur la couche 2 du modele OSI (Datalink), il permet au différent pc connecté sur le même réseau de communiquer entre eux

## Q.3.2 Quel est le matériel réseau B ?
Quel est son rôle pour le réseau 10.10.0.0/16 ?

  Le matériel B est un routeur qui agit sur la couche 3 du modele OSI (Network), il permet la communication entre les réseau 10.10.0.0/16 et le réseau10.12.2.0/24,
  via le routeur R2 il permet aussi de communiquer avec le réseau 172.16.5.0/24, il sert donc de passerelle.

## Q.3.3 Que signifie f0/0 et g1/0 sur l’élément B ?

  f0/0 est l'interface FastEthernet 0
  g1/0 est l'interface GigaEthernet 1

## Q.3.4 Pour l'ordinateur PC2, que représente /16 dans son adresse IP ?

  Le /16 dans l'adresse IP de PC2 indique le masque de réseau de l'adresse IP (CIDR) il correspond à 255.255.0.0

## Q.3.5 Pour ce même ordinateur, que représente l'adresse 10.10.255.254 ?

  Elle représente l'adresse de la passerelle par défaut

## Q.3.6 Pour les ordinateur PC1, PC2, et PC5 donne :


|                        | PC1              | PC2              | PC5              |
| ---------------------- | ---------------- | ---------------- | ---------------- |
| Adresse                | 10.10.4.1/16     | 10.11.80.2/16    | 10.10.4.7/15     |
| Adresse réseaux        | 10.10.0.0/16     | 10.11.0.0/16     | 10.10.0.0/15     |
| Premiere adresse dispo | 10.10.0.1/16     | 10.11.0.1/16     | 10.10.0.1/15     |
| Dernière adresse dipo  | 10.10.255.254/16 | 10.11.255.254/16 | 10.11.255.254/15 |
| Adresse de broadcast   | 10.10.255.255/16 | 10.11.255.255/16 | 10.11.255.255/15 |


## Q.3.7 En t'aidant des informations que tu as fourni à la question 3.6, et à l'aide de tes connaissances, indique parmi tous les ordinateurs du schéma, lesquels vont pouvoir communiquer entre-eux.

  Les PC 1,3,4,5 communique entre eux et les PC 2 et 5 peuvent aussi communiquer

## Q.3.8 De même, indique ceux qui vont pouvoir atteindre le réseau 172.16.5.0/24.

  Les PC 1,3,4,5 peuvent atteindre le réseau grace à la passerelle

## Q.3.9 Quel incidence y-a-t'il pour les ordinateurs PC2 et PC3 si on interverti leur ports de connexion sur le matériel A ?

  Si les VLAN sont séparés sur les port du switch, PC3 ne pourra plus communiquer avec PC1 et PC4. PC2 est sur une autre plage d'adresse donc il ne communique toujours pas

## Q.3.10 On souhaite mettre la configuration IP des ordinateurs en dynamique. Quelles sont les modifications possible ?

  Il suffit d'installer un server DHCP et de configurer les différent PC pour que leur adresse IP soit attribué via le serveur DHCP

## Q.3.11 Sur le paquet N°5, quelle est l'adresse mac du matériel qui initialise la communication ? Déduis-en le nom du matériel.

  Sur le paquet 5 l'addresse mac du matériel qui initialise la communication est 00:50:79:66:68:00 c'est donc PC1

## Q.3.12 Est-ce que la communication enregistrée dans cette capture a réussi ? Si oui, indique entre quels matériel, si non indique pourquoi cela n'a pas fonctionné.

  La communication à réussi, la ligne 6 indique que c'est une réponse à ligne 5. Il s'agit d'un ping avec PC4.

## Q.3.13 Dans cette capture, à quel matériel correspond le request et le reply ? Donne le nom, l'adresse IP, et l'adresse mac de chaque materiel.

  La machine qui initie la demande (request) est: PC1; Adresse IP: 10.10.4.1; Adresse MAC: 00:50:79:66:68:00.  

  La machine qui répond (Reply) est: PC4; Adresse IP: 10.10.4.2; Adresse MAC: 00:50:79:66:68:03.

## Q.3.14 Dans le paquet N°2, quel est le protocole encapsulé ? Quel est son rôle ?

  Le protocole encapsulé dans le paquet 2 est ARP, i lassocie l'adresse IPV4 à l'adrese MAC 

## Q.3.15 Quels ont été les rôles des matériels A et B dans cette communication ?

  Le matériel A à permit aux PC1 et PC4 de communiquer

  Le matériel B n'a jouer aucun rôle dans cet échange

## Q.3.16 Dans cette trame, qui initialise la communication ? Donne l'adresse IP ainsi que le nom du matériel.

  Dans cette trame c'est PC3 qui initie la communication avec en addresse IP 10.10.80.3

## Q.3.17 Quel est le protocole encapsulé ? Quel est son rôle ?

  Le protocole encapsulé est ICMP, c'est un protocole de la couche réseau utilisé par les appareils du réseau pour diagnostiquer les problèmes de communication du réseau.

## Q.3.18 Est-ce que cette communication a réussi ? Si oui, indique entre quels matériel, si non indique pourquoi cela n'a pas fonctionné.

  Non la communication à échoué car le PC3 et le PC2 ne sont pas sur le même réseau

## Q.3.19 Explique la ligne du paquet N° 2

  La ligne du paquet 2 nous apprend que le destinataireavec l'addresse IP 10.10.80.2 est unreachable

## Q.3.20 Quels ont été les rôles des matériels A et B ?

  Le matériel A à permit le lien entre PC3 et le routeur

  Le matériel B à permit à PC3 de lui envoyer des paquets pour PC2, mais comme il ne connait pas l'adresse de PC2 donc ça a échoué

## Q.3.21 Dans cette trame, donne les noms et les adresses IP des matériels sources et destination.

  Matériel source PC4 10.10.4.2/16

  Matériel destinataire est sur le réseau 172.16.5.0 ( on n'a pas son nom) et son adresse IP est 172.16.5.253

## Q.3.22 Quelles sont les adresses mac source et destination ? Qu'en déduis-tu ?

  les adresse IP sont:

  10.10.4.2 adresse source

  172.16.5.253 adresse destionnation

## Q.3.23 A quel emplacement du réseau a été enregistré cette communication ?

  
