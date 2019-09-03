select modele,nom_marque,nom,prix from chaussure,marque,couleur cross join chaussure_couleur on couleur.id=id_couleur where marque.id = id_marque and chaussure.id=id_chaussure;


select client.nom,prenom,EMAIL,adresse.nom,ville.nom,num from client,adresse,ville,code_postal cross join commande where adresse.id = id_adresse and id_client = client.id and code_postal.id=id_code_postal and ville.id=id_ville;

select nom,modele,nom_marque ,count(*) as nombre from couleur, chaussure, marque join pannier where id_couleur=couleur.id and id_chaussure=chaussure.id and id_marque=marque.id group by nom, modele, nom_marque;
