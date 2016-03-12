open Dhcp_wire

let ip = Ipaddr.V4.of_string_exn
let net = Ipaddr.V4.Prefix.of_string_exn
let mac = Macaddr.of_string_exn

let hostname =           "Charrua DHCP Server"
let default_lease_time = 60 * 60 * 1 (* 1 hour *)
let max_lease_time =     60 * 60 * 24 (* A day *)
let ip_address =         ip "192.168.1.5"
let network =            net "192.168.1.5/255.255.255.0"
let range =              (ip "192.168.1.70", ip "192.168.1.100")
(* List of dhcp options to be *)
let options = [
  Routers [ip "192.168.1.5"];
  Dns_servers [ip "192.168.1.5"; (* ip "192.168.1.6" *)];
  (* Ntp_servers [ip "192.168.1.5"]; *)
  Domain_name "pampas";
  (* Check dhcp_wire.mli for all the other options *)
]

(*
 * Static hosts configuration, options are either override or are merged with
 * the global options above.
 *)

(* let static_host_1 = { *)
(*   hostname = "Static host 1"; *)
(*   options = [ *)
(*     Routers [ip "192.168.1.4"]; *)
(*   ]; *)
(*   hw_addr = mac "7a:bb:c1:aa:50:01"; *)
(*   fixed_addr = ip "192.168.1.151"; (\* Must be outside of range. *\) *)
(* } *)

(* let static_host_2 = { *)
(*   hostname = "Static host 2"; *)
(*   options = []; *)
(*   hw_addr = mac "7a:bb:c1:aa:50:02"; *)
(*   fixed_addr = ip "192.168.1.152"; (\* Must be outside of range. *\) *)
(* } *)

(* let hosts = [static_host_1;static_host_2] *)
let hosts = []
