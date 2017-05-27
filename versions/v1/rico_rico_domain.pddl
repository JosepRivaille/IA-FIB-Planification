(define (domain ricoRico)
  (:requirements :strips :typing :adl)
  (:types
    day - object
    dish - object
    mainCourse - dish secondCourse - dish
  )

  (:predicates
    (incompatible ?mc - mainCourse ?sc - secondCourse)
    (assigned ?d - day ?mc - mainCourse ?sc - secondCourse)
    (dayReady ?d - day)
    (used ?d - dish)
  )

  (:action assignMenus
    :parameters (?d - day ?mc - mainCourse ?sc - secondCourse)
    :precondition (and (not (dayReady ?d)) (not (incompatible ?mc ?sc)) (not (used ?mc)) (not (used ?sc)))
    :effect (and (dayReady ?d) (assigned ?d ?mc ?sc) (used ?mc) (used ?sc))
  )
)
