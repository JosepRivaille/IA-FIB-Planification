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
    (init)
  )

  (:action assign
    :parameters (
      ?day - day ?mc - mainCourse ?sc - secondCourse
      ?dayB - day ?mcB - mainCourse ?scB - secondCourse
      ?catSB - category ?catMB - category
    )
    :precondition (or (and (not (init)) (dayBefore ?dayB ?day) (not (dayReady ?day)) (dayReady ?dayB) (not (incompatible ?mc ?sc)) (not (used ?mc)) (not (used ?sc)) (assigned ?dayB ?mcB ?scB) (classified ?mcB ?catMB) (classified ?scB ?catSB) (not (classified ?mc ?catMB))) (and (init) (not (incompatible ?mc ?sc))))
    :effect (and (not (init)) (dayReady ?day) (assigned ?day ?mc ?sc) (used ?mc) (used ?sc))
  )
)
