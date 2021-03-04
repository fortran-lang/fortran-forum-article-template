submodule(library_m) library_s
  implicit none

contains

    module procedure construct_library_t
      new_library_t%datum_ = datum
    end procedure

    module procedure do_something_useful
      ! (not really)
    end procedure

end submodule
