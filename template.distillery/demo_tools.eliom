(* This file was generated by Ocsigen Start.
   Feel free to use it, modify it, and redistribute it as you wish. *)

[%%shared
  open Eliom_content.Html
  open Eliom_content.Html.D
]

[%%shared
  module type DemoPage = sig
    val name : string
    val page_class : string

    val service :
      (unit, unit,
       Eliom_service.get,
       Eliom_service.att,
       Eliom_service.non_co,
       Eliom_service.non_ext,
       Eliom_service.reg,
       [ `WithoutSuffix ],
       unit, unit,
       Eliom_service.non_ocaml)
        Eliom_service.t

    val page :
      unit ->
      ([> `Input | `P | `Div] Eliom_content.Html.D.elt) list Lwt.t
  end
]

let%shared demos = [
  (module Demo_popup : DemoPage);
  (module Demo_carousel1);
  (module Demo_carousel3);
  (module Demo_rpc);
  (module Demo_calendar);
  (module Demo_timepicker)
]

let%shared drawer_contents () =
  let make_link (module D : DemoPage) =
    li [ a ~service:D.service [pcdata @@ D.name] () ]
  in
  let submenu =
    ul ~a:[a_class ["os-drawer-submenu"]] (List.map make_link demos)
  in
  li [ a ~a:[ a_class ["os-drawer-item"] ]
         ~service:%%%MODULE_NAME%%%_services.demo_service
         [pcdata "Demo"] ()
     ; submenu ]