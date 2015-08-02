# json.servers @account.servers
json.servers @account.servers do |server|
  json.account_id server.account_id
  json.hostname   server.hostname
  json.os         server.os
  json.ip_address server.ip_address
  json.uptime     server.uptime
  json.datetime   server.datetime

  json.arps       server.arps
  json.bandwidths server.bandwidths
  json.cpus       server.cpus
  json.disks      server.disks
  json.ios        server.ios
  json.load_avgs  server.load_avgs
  json.memories   server.memories
end

json.mem            @mem.last(100)
json.mem_free       @mem_free.last(100)
json.mem_available  @mem_available.last(100)
json.io             @io.last(100)
