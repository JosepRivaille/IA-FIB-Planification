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

  (:action assignMenus
    :parameters (
      ?d - day ?mc - mainCourse ?sc - secondCourse
      ?db - day ?mcB - mainCourse ?scB - secondCourse
      ?catSB - category ?catMB - category
    )
    :precondition (or
      (and (= ?d Mon) (not (incompatible ?mc ?sc)))
      (and
        (not (= ?d Mon)) (dayBefore ?db ?d) (not (dayReady ?d))
        (not (incompatible ?mc ?sc)) (not (used ?mc)) (not (used ?sc))
        (assigned ?db ?mcB ?scB) (classified ?mcB ?catMB) (classified ?scB ?catSB)
        (not (classified ?mc ?catMB)) (not (classified ?sc ?catSB))
      )
    )
    :effect (and (dayReady ?d) (assigned ?d ?mc ?sc) (used ?mc) (used ?sc))
  )
)
