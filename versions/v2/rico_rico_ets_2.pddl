(define (problem ricoRico) (:domain ricoRico)
  (:objects
    Mon Tue Wed Thu Fri DummyD - day
    Spaghetti_Bolognese Vegan_Sandwich Guacamole_with_tomatoes Sushi  Broccoli_quiche Kirmizi_Mercimek_Corbasi Chinese_Noodles_With_Vegetables Chana_masala Chinese_tiger_salad - mainCourse
    Roast_pork_with_prunes Tuna_steak Chicken_parmesan Lamb_tagine Couscous_meatloaf Coq_au_vin Persian_pie Burrito_pie Spicy_seafood_stew - secondCourse
    Fish Meat Soup Salad Rice Pasta Vegetables DummyC - category
  )
  (:init
    (incompatible Spaghetti_Bolognese Tuna_steak)
    (incompatible Vegan_Sandwich Spicy_seafood_stew)
    (incompatible Kirmizi_Mercimek_Corbasi Chicken_parmesan)
    (incompatible Vegan_Sandwich Roast_pork_with_prunes)
    (incompatible Mushroom_risotto Couscous_meatloaf)
    (incompatible Guacamole_with_tomatoes Lamb_tagine)
    (incompatible Chinese_Noodles_With_Vegetables Spicy_seafood_stew)
    (incompatible Chinese_tiger_salad Burrito_pie)
    (incompatible Sushi Coq_au_vin)

    ; Main courses
    (classified Spaghetti_Bolognese Pasta)
    (classified Vegan_Sandwich Vegetables)
    (classified Guacamole_with_tomatoes Vegetables)
    (classified Sushi Fish)
    (classified Broccoli_quiche Vegetables)
    (classified Kirmizi_Mercimek_Corbasi Soup)
    (classified Chinese_Noodles_With_Vegetables Soup)
    (classified Chana_masala Soup)
    (classified Chinese_tiger_salad Fish)
    ; Second courses
    (classified Roast_pork_with_prunes Meat)
    (classified Tuna_steak Fish)
    (classified Chicken_parmesan Meat)
    (classified Lamb_tagine Meat)
    (classified Couscous_meatloaf Meat)
    (classified Coq_au_vin Meat)
    (classified Persian_pie Pasta)
    (classified Burrito_pie Pasta)
    (classified Spicy_seafood_stew Fish)

    (dayBefore DummyD Mon)
    (dayBefore Mon Tue)
    (dayBefore Tue Wed)
    (dayBefore Wed Thu)
    (dayBefore Thu Fri)

    ; Dummy initializations
    (mainReady DummyD)
    (secondReady DummyD)
    (dayMCClassif DummyD DummyC)
    (daySCClassif DummyD DummyC)
  )
  (:goal
    (forall (?d - day)
      (and (mainReady ?d) (secondReady ?d))
    )
  )
)