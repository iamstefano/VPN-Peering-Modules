# Scopo

L'obiettivo del progetto è la creazione di due Virtual Network in Peering con una VPN nella prima.
Si distribuiscono anche due Windows Server PDC01 e PDC02, un Client Windows 10 nella prima vnet e una macchina linux Ubuntu nella seconda vnet.
Viene installato AD tramite script PowerShell su PDC01 e PDC02.
I server sono dotati di un IP pubblico ed hanno le porte RDP abilitate, per semplificare il debug.
Dopo la distribuzione viene scaricato eseguibile dal portale per la connessione VPN punto-sito.
Il certificato era stato creato precedentemente tramite script Powershell e inserito tramite Terraform nella creazione della VPN.
Viene testata la connessione RDP prima tramite gli IP privati via VPN e poi con gli IP pubblici.

## Attenzione

Per eseguire l'esercizio bisogna avere un certificato a disposizione, se non c'è crearlo con lo script PS.

## Elenco file

| File                 | Descrizione                                                           |
| -------------------- | --------------------------------------------------------------------- |
| main.tf              | Contiene il provider, crea il gruppo di risorse e gestisce i moduli   |
| variables.tf         | Contiene variabili main e modules.tf                                  |
| Outputs.tf           | Definisce le variabili in output del root network                     |
| Modulo network       | Crea le virtual network e le subnet                                   |
| Modulo network linux | Crea il lato network per la macchina linux comprensiva di nic         |
| Modulo nic           | Crea dinamicamente le tre network interface per le macchine windows   |
| Modulo peering       | Creano il peering tra le due vnet                                     |
| Modulo storage       | Crea storage e file-share 'allin'                                     |
| Modulo vm            | Crea windows server Pdc01 e Pdc02                                     |
| Modulo vmclientwin   | Crea il client Windows 10                                             |
| Modulo vmclinux      | Crea la vm linux Ubuntu con chiave SSH                                |
| Modulo vpn           | Creazione Vpn gateway e configurazione Vpn, contiene certificato Root |

![Img](./sa-vpnpeeringM2-rg.jpg)
