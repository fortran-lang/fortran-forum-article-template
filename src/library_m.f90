module library_m
  !! Example library module
  implicit none

  private
  public :: library_t

  type library_t
    !! encapsulate library data and procedures
    private
    logical :: datum_ = .false.
  contains
    procedure, nopass :: do_something_useful
  end type

  interface library_t

    pure module function construct_library_t(datum) result(new_library_t)
      !! library_t constructor
      implicit none
      logical, intent(in) :: datum
      type(library_t) new_library_t
    end function

  end interface

  interface

    module subroutine do_something_useful()
      !! library_t utility procedure
      implicit none
    end subroutine

  end interface

end module library_m
