#|--
Para crear una lista vacia usamos
'()

Para agregar elementos a una lista usamos el constructor
(cons ANY LIST)

cons?
(cons? x) → boolean?
 x : any/c
Determines whether some value is a constructed list. 

-------------------------------------------------------------
'()           Constructor                Constante usada para representar una lista vacía
empty?         Predicado                Reconoce únicamente la lista vacía
cons           Constructor             Agrega un elemento a una lista
first          Selector               Devuelve el primer elemento de la lista
rest           Selector           Devuelve la lista sin su primer elemento
cons?         Predicado          Reconoce listas no vacías


(list...) no es un constructor, es un operador, para simplificar la notacion. Agrega un cons a cada elemento y al final una lista vacia
|#


; Invitados es:
; - '()
; - (cons String Invitados)
; interpretación: Invitados representa una lista de nombres de de personas invitadas a la fiesta.


(define Lista1 (cons "Pedro"
      (cons "Maria" 
            '())))

(define Lista2 (list "Maria" "Pedro" empty))
(define Lista3 (cons "Juan" Lista2))

;

(define ListaDigitos (list 0 1 2 3 4 5 6 7 8 9))
(define Lista-1 (cons -1 ListaDigitos))

;Un amigo
; -nombre
; -celular
; Interpretacion
;un amigo es una estructura con un nombre (apodo) para identificarlo y yun num de celular que representamos utilizando un string

(define-struct amigo [nombre celular])

;Lista de Amigos es:
;-'()
;-(cons amigo ListaDeAmigos)


(define amigo0 (make-amigo "Juan Manuel de Rosas" "011-3142987"))
(define amigo1 (make-amigo "Juan Domingo Peron" "011-2153981"))
(define amigo3 (make-amigo "Jose de San Martin" "0332-9112157"))
;(amigo-nombre amigo1)

;La misma lista por medio de (cons..) y por medio de (list...)
(define ListaAm0 (cons amigo3 empty))
(define ListaAm1 (cons amigo1 ListaAm0))
(define ListaAm3 (cons amigo0 ListaAm1))

(define ListaAm4 (list amigo0 amigo1 amigo3))
;(equal? ListaAm3 ListaAm4)

;contiene-amigo?: string list -> boolean
;contiene-amigo? recibe un string y una lista de estructuras y verifica que se encuentre el nombre(string) dentro de la lista
#|(define (contiene-amigo1? nombre-amigo lista) (cond [(empty? lista) #false]
                                                   [(cons? lista) (if (string=? (amigo-nombre (first lista)) nombre-amigo)
                                                                      #true
(contiene-amigo1? nombre-amigo (rest lista)))]))
|#

(define (contiene-amigo-lista? nombre-amigo lista) (cond 
                                                     [(empty? lista) #false]
                                                     [(cons? lista) (if (equal? (first lista) nombre-amigo)
                                                                        #true
                                                                        (contiene-amigo-lista? nombre-amigo (rest lista)))]))

;(first ListaAm3)

;(check-expect (contiene-amigo? "Jose de San Martin" ListaAm4) #true)
;(check-expect (contiene-amigo? "Jose de San" ListaAm4) #false)

;cont-amigo2?: struct list -> boolean
;recibe una estructura y verifica que sus elementos se encuentren en la lista
(define (contiene-amigo2? amigostruct lista) 
  (cond [(empty? lista) #false]
        [(and (cons? lista) (amigo? amigostruct)) 
         (if (and
              (equal? (amigo-nombre (first lista)) (amigo-nombre amigostruct))
              (equal? (amigo-celular (first lista)) (amigo-celular amigostruct)))
                                                              #true
                                                                      
                                                                      (contiene-amigo2? amigostruct (rest lista)))]))

;(contiene-amigo2? amigo1 ListaAm4)

;(contiene-amigo-lista? amigo1 (cons "C" '()))
;(contiene-amigo-lista? "Marcos" (cons "A" (cons "Marcos" (cons "C" '()))))











#|
Tarea
Ejercicio1a: consideramos un color como una string crear diseñar una lista de colores y generen tres ejemplos

Ejercicio1b: redefinir a un color considerendolo ahora como una estructura con tres valores numericos correspondientes a la saturacion Rojo-Verde-Azul de cada color. Vuelva a definir una lista de colores

Ejercicio 2a consideramos planeta como una string crear diseñar uina lista de planetas. Generen tres ejemplos
Ejercicio 2b redefinir a una planeta considerandolo como una estructura con dos campos, el primero correspondera al nombre y el segundo correspodera a la distancia al sol


Ejercicio 3a considereamos un producto de supermercado como una string. crear o diseñar una lista de preocudtos del supermercado. generar 3 ejemplos

Ejercicio 3b redefinir a un producto considerandolo como una estructura con cuatro campos donde
1er campo nombre
2do codigo de barra
3er precio
4 fecha de vencimiento
La fecha de vencimiento tambien debe ser una estructura (una estructura dentro de la estructura producto)
5. imagen del producto


;Ejercicio 1a--------------------------------------------------------
;diseño de datos
color: string

;ListadeColores es:
;'()
;-(cons string ListaDeColores

;Intepretacion: lista de colores representa a una lista de colores enunciados por su nombre
Por ej:
(cons "verde" (cons "rojo '()))
indica la lista con dos colores verde y rojo

Ejercicio 1b----------------------------------------------------------
;Diseño de datos
;un color es
;-rojo: number
;-verde:number
;azul: number

;Interpretacion
(define-struct color [rojo verde azul])

;ListadeColores es:
;'()
;-(cons string ListaDeColores

;Intepretacion: lista de colores representa a una lista de colores enunciados por su nombre
Por ej:
(cons verde (cons rojo '())
;indicar la lista con dos colores verde y rojo respectivamente

(define verde (make-color 15 11 12))
(define rojo (make-color 25 12 5))
|#
;Ejercicio 3 
#|
Diseño de datos
un producto es: estructure
|#

;==========================================================================================================================
#|

contactos es
'()
- (cons string contactos)
interpretacion: contactos representa una listade nombres de personas presentes en una agenda
cons: A list(A) -> list(A)

empty? cons? list(A) -> boolean

(cons "A" (cons "Maria" (cons "C" '())))

Amigo es:
-nombre string
-cel string

constactos es
-'()
-(cons amigo contactos)
buscarcontactos: string contactos -> boolean
buscarcontactos: amigo contactos -> boolean
|#

    
   #|Una Lista-de-montos es: 
; – '()
; – (cons NumeroPositivo Lista-de-montos)
; Lista-de-montos representa una lista con montos de dinero|#

;suma: lista -> number
;(define (suma l) ())
;define verificador lista positivo
(define (lista-posit lista) 
  (cond
    [(empty? lista) #false]
    [(cons? lista)
     (if (and (negative? (first lista)) (lista-posit (rest lista))) #false "ES POSITIVO")]))

(define (lista-posit2 lista) 
  (cond
    [(empty? lista) 0]
    [(cons? lista)
     (if (and (> 0 (first lista)) (lista-posit2 (rest lista))) "ES POSITIVO" "TIENE UN NEGATIVO" )]))

(define (lista-posit3 lista) 
  (cond
    [(empty? lista) #true]
    [(cons? lista)
     (if 
      (> (first lista) 0) 
      (lista-posit3 (rest lista))
      #false 
      )
     ]
    )
  )



(define LISTAPRUEBA1 empty)
(define LISTAPRUEBA2 (list 20 15 3 4))
(define LISTAPRUEBA3 (list 1 1 1 1))
(define LISTAPRUEBA4 (list 1 2 3 4))
(define LISTAPRUEBA5 (list 1 2 3 -4))


;(lista-posit3 LISTAPRUEBA5)

(define (suma l)
  (cond
    [(empty? l) 0]
    [(cons? l) (+ (first l) (suma (rest l)))]))

(check-expect (suma LISTAPRUEBA1) 0)
(check-expect (suma LISTAPRUEBA4) 10)
(check-expect (suma LISTAPRUEBA2) 42)
(check-expect (suma LISTAPRUEBA3) 4)

;empty 1, cuando valla a multiplicar el ultimo elemento, lista vacia, este debe ser uno. De otra forma el producto siempre seria cero.
(define (producto l)
  (cond
    [(empty? l) 1]
    [(cons? l) (* (first l) (producto (rest l)))]))

;(producto LISTAPRUEBA3)

;---------------------------------------------------------------------------------------- ejercicio 9a
;todos-verdaderos : lista -> boolean

(define (todos-verdaderos l)
  (cond
    [(empty? l) #true]
    [
     (cons? l) (and (if (not (false? (first l))) #true #false) ;false si algun elemento es falso
                   (if (todos-verdaderos (rest l)) #true #false ))
     ]
    ))

(define listadetrue (list #t #t #t #t))

;(todos-verdaderos listadetrue)
;----------------------------------------------------------------------------------------ejercicio 9b

(define (algun-verdadero l)
  (cond
    [(empty? l) #false]
    [
     (cons? l) (or (if (not (false? (first l))) #true #false) ;false si algun elemento es falso
                   (if (algun-verdadero (rest l)) #true #false ))
     ]
    ))


#|
(define (algun-verdadero l)
  (cond
    [(empty? l) 0]
    [
     (cons? l) (if (=
                    (+
                    (+ (if (false? (first l)) 1 0) 0)
                    (+ (if (false? (rest l)) 1 0) 0)) 0) #true #false
     )]
))
|#

(define listaconuntrue (list #false #false #false #true))
(define listatodofalse (list #false #false #false))
;(algun-verdadero listatodofalse)

;------------------------------- ejercicio 10
(define (cat l)
  (cond
    [(empty? l) ""]
    [
     (cons? l) (string-append (first l) (cat (rest l)))
     ]))

(define listapalabras (list "a " "b " "c "))
;(cat listapalabras)

;-------------------------------- ejercicio 11
;cant-elementos list -> number

(define (cant-elementos l)
  (cond
    [(empty? l) 0 ]
    [(cons? l)
     (+
      
      1 (cant-elementos (rest l))
        
      )]))
;(cant-elementos listaconuntrue)

;------------------------------------ ejercicio 17
(define (positivos l)
  (cond [(empty? l) empty]
        [(cons? l)
         (if (positive? (first l)) (cons (first l) (positivos (rest l)))
                                        (positivos(rest l))) ]))

;----------------------------------------ejercicio 15
#;(
sig:
mayores: lista number number  -> lista number
prop: toma una lista de nunmeros L y un numero N y construye otra lista formado por los numeros mayores que n en la lista L
mayores o iguales
)

(define (mayores l n)
  (cond [(empty? l) empty]
        [(cons? l)
         (if (> (first l) n) (cons (first l) (mayores (rest l) n))
                                       (mayores (rest l) n)) ]))

;ejemplos
;(check-expect (mayores (list empty) -1) empty)
(define listamayores1 (list 3 5 1 0 -1))
(check-expect (mayores listamayores1 2) (list 3 5))
(check-expect (mayores listamayores1 3) (list 5))
(check-expect (mayores listamayores1 0) (list 3 5 1))
(check-expect (mayores listamayores1 7) empty) 

;-----------------------------------------------------ejercicio 14
#;(Ejercicio 14. Diseñe una función cortas que tome una lista de strings y devuelva una lista con aquellas palabras de longitud menor a 5.

             )

(define (cortas l)
  (cond [(empty? l) empty]
        [(cons? l)
         (if (< (string-length (first l)) 5) (cons (first l) (cortas (rest l)))
                                       (cortas (rest l))) ]))

(define listacorta1 (list "Lista" "de" "palabras" "sin" "sentido"))

(cortas listacorta1)

;------------------------------------------------- ejercicio 18
#;( Diseñe una función eliminar que tome una lista de números y un número y devuelva la lista luego de eliminar el número que indica el 2do argumento)

(define (eliminar l n)
  (cond [(empty? l) empty]
        [(cons? l)
         (if (equal? (first l) n) (eliminar (rest l) n)
             (cons (first l) (eliminar (rest l) n))
                                       ) ]))
(check-expect (eliminar listamayores1 1) (list 3 5 0 -1))
(check-expect (eliminar listamayores1 3) (list 5 1 0 -1))

;________________________________-
#;(Diseñe la función raices, que dada una lista de números, devuelve una lista con las raíces cuadradas de sus elementos.
)


(define (raices2 l)
  (cond
    [(empty? l) empty]
    [(cons? l) (if (< (first l) 0)
                   (raices2 (rest l))
                           (cons (sqrt (first l)) (raices2 (rest l))))]))

(define raices1 (list 9 16 4))
(define (raices l)
  (cond
    [(empty? l) empty]
    [(cons? l)
     (cons (sqrt (first l)) (raices (rest l)))]))

(check-expect (raices raices1) (list 3 4 2))
(check-expect (raices (list 25 81 1)) (list 5 9 1))

;------------------------
#;(Diseñe una función anchos que tome una lista de imágenes y devuelva una lista con el ancho de cada una
   )

(define (cir c)(circle c "solid" "red"))
(define lista-imagenes (list
                        (cir 10)
                        (cir 15)
                        (cir 20)))

(define (anchos l)
  (cond [(empty? l) empty]
        [(cons? l)
         (cons (image-width (first l)) (anchos (rest l)))]))

(anchos lista-imagenes)

;--------------------------------------

;Ejercicio 28. Diseñe una función max que devuelve en máximo de una lista de naturales. Para la lista vacía, devuelve 0. 
(define (max2 l)
  (cond
    [(empty? l) 0]
    [(cons? l)
     (if 
      (> (first l) (max2 (rest l)))
      (first l)
      (max2 (rest l))
      )
     ]))

(max2 (list 23 543 325 0 75))

#;(Diseñe una función sumcuad que dada una lista de números devuelve la suma de sus cuadrados. Para la lista vacía, devuelve 0. )

(define (sumcad l)
  (cond
    [(empty? l) 0]
    [(cons? l)
     (+ (sqr (first l)) (sumcad (rest l)))
     ]))

(sumcad (list 1 2 3))

;Ejercicio 26. Diseñe una función prod que multiplica los elementos de una lista de números. Para la lista vacía, devuelve 1. 

(define (prod l)
  (cond
    [(empty? l) 1]
    [(cons? l)
     (* (first l) (prod (rest l)))
     
     ]))

(prod (list 1 2 3 4 5))

;Ejercicio 29. Diseñe una función sumdist que tome una lista de puntos del plano y devuelva la suma de sus distancias al origen.

(define (sumdist l)
  (cond
    [(empty? l) 0]
    [(cons? l)
     (+ (sqrt (+ (sqr (posn-x (first l)))  (sqr (posn-y (first l))))) (sumdist (rest l))
     )]))

;(sumdist (list (make-posn 3 4) (make-posn 0 4) (make-posn 12 5)))

;Ejercicio 27. Diseñe una función pegar que dada una lista de strings, devuelve el string que se obtiene de concatenar todos los elementos de la lista. 

(define (pegar l)
  (cond
    [(empty? l) ""]
    [(cons? l)
     (string-append (first l) (pegar (rest l)))]))

(pegar (list "Las " "lis" "tas " "son " "complicadas" "."))

;Ejercicio 24. Diseñe una función longitudes que tome una lista de cadenas y devuelva una lista de números que corresponda con la longitud de cada cadena de la lista original.

(define (longitudes l)
  (cond
    [(empty? l) empty]
    [(cons? l)
     (cons (string-length (first l)) (longitudes (rest l)))
     ]))

(longitudes(list "hola" "cómo" "estás?"))

;Ejercicio 23. Diseñe una función cuadrados que tome una lista de números y devuelva otra lista donde los elementos que aparezcan sean el cuadrado de los elementos de la lista original.

(define (cuadrados l)
  (cond
    [(empty? l) empty]
    [(cons? l)
     (cons (sqr (first l)) (cuadrados (rest l)))
     ]))
    (cuadrados (list 1 2 3))  