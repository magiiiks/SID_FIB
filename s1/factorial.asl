/* Creencias iniciales */
limit(5).
fact(0, 1).

/* Planes */
+fact(X, Y): X < 5 <-
   +fact(X + 1, (X + 1) * Y).

+fact(X, Y): limit(X) <-
   .print("fact 5 == ", Y).
