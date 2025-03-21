(define (domain puzzledmn)
    (:requirements :typing :strips :negative-preconditions :action-costs)

    (:types 
        tile_white tile_black - tile 
        location
    )

    (:predicates
        (at ?tile - tile ?lc - location)
        (empty ?location - location)    
        (next ?location1 ?location2 - location)  
        (jump-next ?location1 ?location2 ?location3 - location)
    )

(:functions
    (total-cost)
)


    (:action move
        :parameters (?tile - tile ?from ?to - location)
        :precondition (and
            (at ?tile ?from)
            (empty ?to)
            (next ?from ?to)
        )
        :effect (and
            (not (at ?tile ?from))
            (at ?tile ?to)
            (not (empty ?to))
            (empty ?from)
            (increase (total-cost) 1)
        )
    )

    (:action jump
        :parameters (?tile - tile ?from ?over ?to - location)
        :precondition (and
            (at ?tile ?from)
            (empty ?to)
            (jump-next ?from ?over ?to)
        )
        :effect (and
            (not (at ?tile ?from))
            (at ?tile ?to)
            (not (empty ?to))
            (empty ?from)
            (increase (total-cost) 2)
        )
    )
)

