p("Mareas Vivas",1998).
p("Pratos combinados", 1995).
p("Padre Casares",2008).
p("Serramoura",2014).
p("Matalobos",2009).
p("Libro de familia",2005).
p("As leis de Celavella",2003).
p("Fari�a",2018).
p("Vivir sin permiso",2018).
p("N�boa",2020).
a("Emma Suarez").
a("Isabel Naveira").
a("Luis Zahera").
a("Luis Tosar").
a("Ernesto Chao").
a("Mabel Rivera").
a("Mar�a Castro").
a("Antonio Dur�n").
a("Pedro Alonso").
a("Alfonso Agra").
a("Ux�a Blanco").
a("Sabela Ar�n").
a("Luis Iglesia").
a("M�nica Cama�o").
a("Mar�a Mera").
a("Tacho Gonz�lez").
a("Jos� Coronado").
a("Manuel San Mart�n").
a("Mayka Bra�a").
a("Luc�a Regueiro").
a("Manuel Cort�s").
a("Eva Fern�ndez").
a("Javier Rey").
a("Trist�n Ulloa").
a("Antonio Dur�n").
a("Antonio Mourelos").
a("�lex Gonz�lez").
a("Claudia Traisac").
actua("Mareas Vivas", "Luis Zahera").
actua("Mareas Vivas", "Luis Tosar").
actua("Pratos Combinados", "Ernesto Chao").
actua("Pratos Combinados", "Mabel Ribeira").
actua("Pratos Combinados", "Mar�a Castro").
actua("Padre Casares", "Antonio Dur�n").
actua("Padre Casares", "Pedro Alonso").
actua("Padre Casares", "Tacho Gonz�lez").
actua("Serramoura", "Alfonso Agra").
actua("Serramoura", "Ux�a Blanco").
actua("Serramoura", "Alfonso Agra").
actua("Matalobos", "Luis Iglesia").
actua("Matalobos", "M�nica Cama�o").
actua("Matalobos", "Maria Mera").
actua("Vivir sin permiso","�lex Gonz�lez").
actua("Vivir sin permiso","ClaudiaTraisac").
actua("Vivir sin permiso","Jos� Coronado").
actua("Fari�a","Javier Rey").
actua("Fari�a","Trist�n Ulloa").
actua("Fari�a","Antonio Dur�n").
actua("As leis de Celavella","Antonio Mourelos").
actua("As leis de Celavella","Eva Fern�ndez").
actua("As leis de Celavella","Manuel Cort�s").
actua("Libro de familia","Luc�a Regueiro").
actua("Libro de familia","Mayka Bra�a").
actua("Libro de familia","Manuel San Mart�n").
actua("Neboa","Emma Suarez").
actua("Neboa","Isabel Naveira").

estrenada_despues(P, A):- p(P,A1),A1>A.
participan(A1, A2):- actua(P,A1),actua(P,A2),A1\==A2.
estrenada_antes(P, A):-p(P,A1), A1<A.
mismo_a�o(P1, P2):- p(P1,A), p(P2,A),P1\==P2,!. %se establece un corte en esta regla para que no devuelva las mismas dos series cambiadas de orden.%
mas_de_una_serie(A):-actua(P1,A),actua(P2,A),P1\==P2,!.
