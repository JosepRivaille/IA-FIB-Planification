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
      ?dayB - day ?mcB - mainCourse ?scB - secondCourse
      ?catMB - category ?catSB - category
      ?catMC - category ?catSC - category
    )
    :precondition (and (not (dayReady ?day)) (not (used ?mc)) (not (used ?sc)) (dayBefore ?dayB ?day)
      (classified ?mc ?catMC) (classified ?sc ?catSC) (classified ?mcB ?catMB) (classified ?scB ?catSB)
      (assigned ?dayB ?mcB ?scB) (not (= ?catMB ?catMC)) (not (= ?catSB ?catSC))) 
    :effect (and (dayReady ?day) (assigned ?day ?mc ?sc) (used ?mc) (used ?sc))
  )
)