(define (domain ricoRico)
  (:requirements :strips :typing :adl)
  (:types 
    day - object
    dish - object
    mainCourse - dish secondCourse - dish
  )

  (:predicates
    (incompatible ?mc - mainCourse ?sc - secondCourse)
    (assigned ?day - day ?mc - mainCourse ?sc - secondCourse)
    (dayReady ?d - day)
    (used ?d - dish)
  )

  (:action assign
    :parameters (?day - day ?mc - mainCourse ?sc - secondCourse) 
    :precondition (and (not (dayReady ?day)) (not (used ?mc)) (not (used ?sc)))
    :effect (and (dayReady ?day) (assigned ?day ?mc ?sc) (used ?mc) (used ?sc))
  )
)