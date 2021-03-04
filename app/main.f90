program main
  !! Demonstration of
  !! 1. Runtime checking of assertions that represent pre- and post-conditions.
  !! 2. Conditional output of variable diagnostic data inside a pure procedure.
  use assertions_interface, only : assert
  implicit none

  print *,"reciprocal(2.) = ",reciprocal(2.)

contains

  pure function reciprocal(x) result(over_x)
    real, intent(in) :: x
    real over_x
    real, parameter :: tolerance = 1.E-06

    call assert(x/=0.,"main: x/=0.") ! precondition

    over_x = 1./x

    call assert(abs(x*over_x-1.) < tolerance,"main: x*reciprocal(x) ~ 1.", diagnostic_data = over_x) ! postcondition
  end function

end program
