/* Beliefs */
adyacente(a, b).
adyacente(b, c).
adyacente(c, d).
adyacente(d, a).

localizado(robot, a).
localizado(papelera, c).
localizado(papel_usado, d).


/* Goals */
!tirado(papel_usado, papelera).

/* Events */	
+localizado(robot, X) : localizado(papel_usado, X)
			<- .print("papel cogido en ", X); 
			   -localizado(papel_usado, X); 
			   +llevando(papel_usado).

+localizado(robot, X) : localizado(papelera, X) &
				llevando(papel_usado)
			<- .print("todo el papel tirado a la papelera en ", X);
				-llevando(papel_usado);
				+tirado(papel_usado, papelera).
				

+!tirado(papel_usado, papelera) : tirado(papel_usado, papelera) <- .print("Ha tirado el papel").
 
+!tirado(papel_usado, papelera) : localizado(robot, Y) &
					adyacente(Y,Z)
			<- .print("mover de ", Y, " a ", Z); 
			   -localizado(robot, Y); 
			   +localizado(robot, Z);
			   !tirado(papel_usado, papelera).
