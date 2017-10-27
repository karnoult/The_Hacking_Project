### MOOCademy

- Cours
  - **titre**: string \[unique, 4-50 chars, present\]
  - **description**: text \[4-1000 chars, present\]
  - has_many **lecons**
- Lecon
  - **titre**: string \[unique, 4-50 chars, present\]
  - **contenu**: text \[present\]
  - **cours_id**: integer \[present\]

### The Hacking Pinterest

- Utilisateur
  - **nom**: string \[unique, 1-15 chars, present\]
  - has_many **pins**
  - has_many **commentaires**
- Pin
  - **url_image**: string \[present\]
  - **utilisateur_id**: integer \[present\]
  - has_many **commentaires**
- Commentaire
  - **contenu**: text \[present\]
  - **pin_id**: integer \[present\]
  - **utilisateur_id**: integer \[present\]

### The Hacking News

- Utilisateur
  - **nom**: string \[unique, 1-15 chars, present\]
  - has_many **liens**
  - has_many **commentaires**
- Lien
  - **url**: string
  - **utilisateur_id**:integer \[present\]
  - has_many **commentaires**
- Commentaire
  - **contenu**: text \[present\]
  - **utilisateur_id**: integer \[present\]
  - **lien_id**: integer \[present\]
  - **commentaire_id**: integer
  - has_many **commentaires**

### The Hacking Class

- Eleve
  - **nom**: string \[present\]
  - **cours_id**: integer \[present\]
- Cours
  - **titre**: string \[unique, 4-50 chars, present\]
  - **description**: text \[4-1000 chars, present\]
  - has_many **eleves**
