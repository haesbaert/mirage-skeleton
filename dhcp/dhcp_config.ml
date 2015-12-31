open Dhcp_wire

let ip = Ipaddr.V4.of_string_exn
let net = Ipaddr.V4.Prefix.of_string_exn

let hostname =           "Charrua DHCP Server"
let default_lease_time = 60 * 60 * 1 (* 1 hour *)
let max_lease_time =     60 * 60 * 24 (* A day *)
let ip_address =         ip "192.168.1.5"
let network =            net "192.168.1.5/255.255.255.0"
let range =              (ip "192.168.1.70", ip "192.168.1.100")
let hosts =              []
let options = [
  Routers [ip "192.168.1.5"];
  Dns_servers [ip "192.168.1.5"];
]
