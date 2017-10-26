## MOOCademy

- Cours
  - **titre**: string \[unique, 4-50 chars, present\]
  - **description**: text \[4-1000 chars, present\]
  - has_many **lecons**
- Lecon
  - **titre**: string \[unique, 4-50 chars, present\]
  - **contenu**: text text \[present\]
  - **cours_id**:integer \[present\]
  
