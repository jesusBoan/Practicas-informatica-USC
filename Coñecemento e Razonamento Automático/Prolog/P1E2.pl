p("Mareas Vivas",1998).
p("Pratos combinados", 1995).
p("Padre Casares",2008).
p("Serramoura",2014).
p("Matalobos",2009).
p("Libro de familia",2005).
p("As leis de Celavella",2003).
p("Fariña",2018).
p("Vivir sin permiso",2018).
p("Néboa",2020).
a("Emma Suarez").
a("Isabel Naveira").
a("Luis Zahera").
a("Luis Tosar").
a("Ernesto Chao").
a("Mabel Rivera").
a("María Castro").
a("Antonio Durán").
a("Pedro Alonso").
a("Alfonso Agra").
a("Uxía Blanco").
a("Sabela Arán").
a("Luis Iglesia").
a("Mónica Camaño").
a("María Mera").
a("Tacho González").
a("José Coronado").
a("Manuel San Martín").
a("Mayka Braña").
a("Lucía Regueiro").
a("Manuel Cortés").
a("Eva Fernández").
a("Javier Rey").
a("Tristán Ulloa").
a("Antonio Durán").
a("Antonio Mourelos").
a("Álex González").
a("Claudia Traisac").
actua("Mareas Vivas", "Luis Zahera").
actua("Mareas Vivas", "Luis Tosar").
actua("Pratos Combinados", "Ernesto Chao").
actua("Pratos Combinados", "Mabel Ribeira").
actua("Pratos Combinados", "María Castro").
actua("Padre Casares", "Antonio Durán").
actua("Padre Casares", "Pedro Alonso").
actua("Padre Casares", "Tacho González").
actua("Serramoura", "Alfonso Agra").
actua("Serramoura", "Uxía Blanco").
actua("Serramoura", "Alfonso Agra").
actua("Matalobos", "Luis Iglesia").
actua("Matalobos", "Mónica Camaño").
actua("Matalobos", "Maria Mera").
actua("Vivir sin permiso","Álex González").
actua("Vivir sin permiso","ClaudiaTraisac").
actua("Vivir sin permiso","José Coronado").
actua("Fariña","Javier Rey").
actua("Fariña","Tristán Ulloa").
actua("Fariña","Antonio Durán").
actua("As leis de Celavella","Antonio Mourelos").
actua("As leis de Celavella","Eva Fernández").
actua("As leis de Celavella","Manuel Cortés").
actua("Libro de familia","Lucía Regueiro").
actua("Libro de familia","Mayka Braña").
actua("Libro de familia","Manuel San Martín").
actua("Neboa","Emma Suarez").
actua("Neboa","Isabel Naveira").

estrenada_despues(P, A):- p(P,A1),A1>A.
participan(A1, A2):- actua(P,A1),actua(P,A2),A1\==A2.
estrenada_antes(P, A):-p(P,A1), A1<A.
mismo_año(P1, P2):- p(P1,A), p(P2,A),P1\==P2,!. %se establece un corte en esta regla para que no devuelva las mismas dos series cambiadas de orden.%
mas_de_una_serie(A):-actua(P1,A),actua(P2,A),P1\==P2,!.
