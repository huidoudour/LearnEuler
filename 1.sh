$TTL 86400
@       IN      SOA     ecs1.example.com. root.example.com. (
                              2024103101  ; Serial
                              3600        ; Refresh
                              1800        ; Retry
                              604800      ; Expire
                              86400       ; Minimum TTL
                              )

@       IN      NS      ecs1.example.com.
@       IN      A       192.168.1.100
www     IN      A       192.168.1.101
