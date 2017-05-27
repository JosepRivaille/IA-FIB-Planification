(define (domain ricoRico)
  (:requirements :strips :typing :adl :equality)
  (:types 
    day - object
    dish - object
    category - object
    mainCourse - dish secondCourse - dish
  )

  (:predicates
    (incompatible ?mc - mainCourse ?sc - secondCourse)
    (assigned ?day - day ?mc - mainCourse ?sc - secondCourse)
    (dayReady ?d - day)
    (used ?d - dish)
    (classified ?d - dish ?c - category)
    (dayBefore ?cd - day ?db - day)
  )

  (:action assign
    :parameters (
      ?day - day ?mc - mainCourse ?sc - secondCourse
    )
    :precondition (and (not (incompatible ?mc ?sc)) (not (dayReady ?day)) (not (used ?mc)) (not (used ?sc)) (dayBefore ?day ?dayB) (assigned ?dayB ?mcB ?scB) (classified ?mcB catMB)(classified ?scB catSB)(not(classified ?mc catMB)) (not(classified ?sc ?catSB)))
    :effect (and (dayReady ?day) (assigned ?day ?mc ?sc) (used ?mc) (used ?sc))
  )
)
