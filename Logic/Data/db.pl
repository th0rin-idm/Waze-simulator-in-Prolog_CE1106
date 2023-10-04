%Distancias del grafo
%San José
d("SanJose","Cartago",20).
d("SanJose","Corralillo",22).
%Corralillos
d("Corralillo","SanJose",22).
d("Corralillo","MusgoVerde",6).
%Musgo Verde
d("MusgoVerde","Corralillo",6).
d("MusgoVerde","Cartago",10).
%Cartago
d("Cartago","MusgoVerde",10).
d("Cartago","SanJose",20).
d("Cartago","Paraiso",10).
d("Cartago","TresRios",8).
d("Cartago","Pacayas",13).
%Tres Ríos
d("TresRios","Pacayas",15).
d("TresRios","SanJose",8).
%Pacayas
d("Pacayas","TresRios",15).
d("Pacayas","Cartago",13).
d("Pacayas","Cervantes",8).
%Paraíso
d("Paraiso","Cervantes",4).
d("Paraiso","Cachi",10).
d("Paraiso","Orosi",8).
%Cervantes
d("Cervantes","JuanVinas",5).
d("Cervantes","Pacayas",8).
d("Cervantes","Cachi",7).
%Orosi
d("Orosi","Paraiso",8).
d("Orosi","Cachi",12).
%Juan Viñas
d("JuanVinas","Turrialba",4).
%Cachí
d("Cachi","Turrialba",40).
d("Cachi","Cervantes",7).
d("Cachi","Paraiso",10).
d("Cachi","Orosi",12).
%Turrialba
d("Turrialba","Cachi",40).
d("Turrialba","Pacayas",18).