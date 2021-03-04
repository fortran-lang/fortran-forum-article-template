module example_m
  !! Example derived type
  implicit none

  private
  public :: example_t

  type example_t
  end type

end module

module example_test
   !! demonstrate a Vegetables unit test for an example derived type
   use example_m, only : example_t
   use vegetables, only: &
     result_t, test_item_t, & ! types
     describe, it, succeed ! functions
   use iso_fortran_env, only : event_type
   implicit none

   private
   public :: test_example

contains

  function test_example() result(tests)
    type(test_item_t) tests

    tests = describe( &
     "example class", &
     [it( &
       "intrinsic constructor assignment completes without error", &
       verify_intrinsic_constructor_assignment) &
       ])

  end function

  function verify_intrinsic_constructor_assignment() result(result_)
    type(example_t) example
    type(result_t) result_

    example = example_t()

    result_ = succeed("example = example_t()")

  end function

end module example_test
