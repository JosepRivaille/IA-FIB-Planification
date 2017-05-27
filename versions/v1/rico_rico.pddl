(define (problem ricoRico) (:domain ricoRico)
  (:objects
    Mon Tue Wed Thu Fri - day
    Spaghetti_Bolognese Mediterranean_Salad Vegan_Sandwich Mushroom_risotto Guacamole_with_tomatoes Sushi American_burger - mainCourse
    Roast_pork_with_prunes Spanish_omelette Paella Tuna_steak Chicken_parmesan Lamb_tagine Couscous_meatloaf - secondCourse
  )
  (:init
    (incompatible Spaghetti_Bolognese Paella)
    (incompatible Mediterranean_Salad Chicken_parmesan)
    (incompatible Vegan_Sandwich Roast_pork_with_prunes)
    (incompatible Mushroom_risotto Couscous_meatloaf)
    (incompatible Guacamole_with_tomatoes Lamb_tagine)
  )
  (:goal
    (forall (?d - day)
      (dayReady ?d)
    )
  )
)
