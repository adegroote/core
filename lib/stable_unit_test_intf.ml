(* An interface for creating unit tests to check stability of sexp and bin-io
   serializations

   vgatien-baron: Unfortunately, moving this module type to Stable_unit_tests creates
   circular dependencies. *)

module type Arg = sig
  type t with sexp, bin_io
  val equal : t -> t -> bool
  (* [tests] is a list of (value, sexp-representation, bin-io-representation) triples.
     The ounit tests created by this functor check that the type properly serializes and
     de-serializes according to the given representations. *)
  val tests : (t * string * string) list
end

