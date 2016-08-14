# json.servers @account.servers
json.servers @account.servers do |server|
  json.id server.id
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

json.mem            @mem.sort_by{|e| e[0]}.last(200)
json.mem_free       @mem_free.sort_by{|e| e[0]}.last(200)
json.mem_available  @mem_available.sort_by{|e| e[0]}.last(200)
json.io             @io.sort_by{|e| e[0]}.last(100)
