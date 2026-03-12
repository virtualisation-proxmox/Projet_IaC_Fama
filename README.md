Projet Infrastructure as Code (IaC) : Déploiement Automatisé Web & DB

Ce projet démontre la mise en place d'une infrastructure automatisée sur un serveur Proxmox
en utilisant Terraform pour le provisionnement et Ansible pour la configuration logicielle

Niveau 1 : Provisionnement

Terraform :
Communique avec l'API de Proxmox pour réserver les ressources matérielles.
Création de 2 VMs Linux (vm-webfama et vm-dbfama) sur le nœud Proxmox
en définissant le nombre de CPU, la RAM et la taille du disque (20 Go) pour chaque VM.
Injecte la clé publique SSH pour permettre l'accès futur sans mot de passe
Utilisation des commandes terraform apply et terraform destroy pour gérer le cycle de vie des ressources

Ansible:

Configuration : Installation automatisée de Nginx sur la VM Web et de MariaDB sur la VM DB.
Gestion des services : Activation et démarrage des services pour garantir qu'ils soient opérationnels immédiatement.
Utilisateur : Gestion des accès via l'utilisateur système ubuntu et injection de clés SSH


