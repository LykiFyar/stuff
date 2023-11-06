/*

Finish the specification of this notification concept,
including its events, scenarios, and operational principles.

*/ 

sig Resource {}

sig User {
	var reservations : set Resource
}

var sig Available in Resource {}

pred reserve[u : User, r : Resource] {
	// Make a reservation
	r in Available
	Available' = Available - r
	reservations' = reservations + u->r
}

pred cancel[u : User, r : Resource] {
	// Cancel a reservation
	r in u.reservations
	Available' = Available + r
	reservations' = reservations - u->r
}

pred use[u : User, r : Resource] {
	// Use a reserved resource
	r in u.reservations
	Available' = Available
	reservations' = reservations - u->r
}

pred cleanup {
	// Make all used resources available again

	some Resource - Available - User.reservations

	Available' = Resource - User.reservations
	reservations' = reservations
}

pred stutter {
	Available' = Available
	reservations' = reservations
}

fact {
	Available = Resource
	no reservations
	always {
		stutter
		or 
		cleanup
		or 
		(some u : User , r : Resource| reserve[u,r] or cancel[u,r] or use[u,r])
	}
}

// Validation

run Example {
	// Empty run to be used for simulation
}

run Scenario1 {
	// An user reserves a resource, uses it, and finally a cleanup occurs

} expect 1

run Scenario2 {
	// An user reserves a resource, cancels the reservation, and reserves again

} expect 1

run Scenario3 {
	// An user reserves two resources, cancels one, uses the other, and finally a cleanup occurs

} expect 1

run Scenario4 {
	// Two users try to reserve the same resource

} expect 0

run Scenario5 {
	// Eventually a cleanup is performed twice in a row

} expect 0

// Verification

check OP1 {
	// Reserved resources aren't available
	always (no Available & User.reservations)
}

check OP2 {
	// Used resources were reserved before
	
}

check OP3 {
	// Used resources can only be reserved again after a cleanup

}

check OP4 {
	// After a cleanup all unreserved resources are available

}

check OP5 {
	// Cancel undoes reserve

}

check OP6 {
	// If a cleanup occurs some resource was used before

}

check OP7 {
	// Used resources were not canceled since being reserved

}

check OP8 {
	// Reserved resources can be used while not used or canceled

}

check OP9 {
	// The first event to occur will be a reservation

}

check OP10 {
	// If cleanups and cancels never occur the available resources keep diminishing

}
