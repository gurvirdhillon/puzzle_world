(define (problem problemfile)
    (:domain puzzledmn)
    (:objects
        btile - tile_black
        wtile1 wtile2 - tile_white
        location1 location2 location3 location4 - location
    )
    (:init
        (at btile location1)  
        (empty location2)  
        (at wtile1 location3)
        (empty location4)  
        (at wtile2 location4)

        (next location1 location2)
        (next location2 location3)
        (next location3 location4)
        (next location2 location1)
        (next location3 location2)
        (next location4 location3)

        (jump-next location1 location2 location3)
        (jump-next location2 location3 location4)
        (jump-next location3 location2 location1)
        (jump-next location4 location3 location2)
        (= (total-cost) 0)
    )

    (:goal 
        (and 
            (at btile location4)
        )
    )
    (:metric minimize (total-cost))
)
