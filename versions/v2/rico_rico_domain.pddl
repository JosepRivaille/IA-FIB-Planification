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
      ?catSB - category ?catMB - category
    )
    :precondition (or (and (not(= ?day Mon)) (dayBefore ?dayB ?day) (not (dayReady ?day)) 
      (not (incompatible ?mc ?sc)) (not (used ?mc)) 
      (not (used ?sc)) (assigned ?dayB ?mcB ?scB) (classified ?mcB ?catMB) (classified ?scB ?catSB) 
      (not (classified ?mc ?catMB)) (not (classified ?sc ?catSB))) (and (= ?day Mon) (not (incompatible ?mc ?sc))))
    :effect (and (dayReady ?day) (assigned ?day ?mc ?sc) (used ?mc) (used ?sc))
  )
)
