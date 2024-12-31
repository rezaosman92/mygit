{ config, ... }:

{

 services.resolved = {
   enable = true;
   dnsovertls = "true";
   dnssec = "true";
   extraConfig = "
                  DNS=45.90.28.0#b6ec66.dns.nextdns.io
                  DNS=2a07:a8c0::#b6ec66.dns.nextdns.io
                  DNS=45.90.30.0#b6ec66.dns.nextdns.io
                  DNS=2a07:a8c1::#b6ec66.dns.nextdns.io
               ";
 };

}
