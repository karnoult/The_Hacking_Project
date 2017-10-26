## MOOCademy

- Cours
  - **titre**: string \[unique, 4-50 chars, present\]
  - **description**: text \[4-1000 chars, present\]
  - has_many **lecons**
- Lecon
  - **titre**: string \[unique, 4-50 chars, present\]
  - **contenu**: text \[present\]
  - **cours_id**:integer \[present\]
  
## The Hacking Pinterest

- Utilisateur
  - **username**: string \[unique, 4-15 chars, present\]
  - has_many **pins**
  - has_many **commentaires**
- Pin
  - **url_image**: string
  - **utilisateur_id**:integer \[present\]
  - has_many **commentaires**
- Commentaire
  - **contenu**: text \[present\]
  - **pin_id**:integer \[present\]
  - **utilisateur_id**:integer \[present\]
