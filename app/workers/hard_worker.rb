
class HardWorker
  include Sidekiq::Worker

  def perform(server_id)
    server = Server.find(server_id)

    cpu(server)
    memory(server)
    load_avg(server)
    bandwidth(server)
    io(server)
  end

  def self.poller
    Account.all.each do |account|
      next if account.servers.empty?
      account.servers.each do |server|
        next if server.ip_address.nil?
        perform_async(server.id)
      end
    end
  end

  def cpu(server)
    cpu = server.cpus.first_or_create

    url = "http://#{server.ip_address}:9999/cpu_info"
    response = Net::HTTP.get_response(URI.parse(url))
    items = JSON.parse(response.body)

    cpu.architecture        = items['Architecture']
    cpu.cpu_op_mode_s       = items['CPU op-mode(s)']
    cpu.byte_order          = items['Byte Order']
    cpu.cpu_s               = items['CPU(s)']
    cpu.on_line_cpu_s_list  = items['On-line CPU(s) list']
    cpu.thread_s_per_core   = items['Thread(s) per core']
    cpu.core_s_per_socket   = items['Core(s) per socket']
    cpu.socket_s            = items['Socket(s)']
    cpu.numa_node_s         = items['NUMA node(s)']
    cpu.vendor_id           = items['Vendor ID']
    cpu.cpu_family          = items['CPU family']
    cpu.model               = items['Model']
    cpu.m_name              = items['Model name']
    cpu.stepping            = items['Stepping']
    cpu.cpu_mhz             = items['CPU MHz']
    cpu.bogo_mips           = items['BogoMIPS']
    cpu.virtualization      = items['Virtualization']
    cpu.hypervisor_vendor   = items['Hypervisor vendor']
    cpu.virtualization_type = items['Virtualization type']
    cpu.l1d_cache           = items['L1d cache']
    cpu.l1i_cache           = items['L1i cache']
    cpu.l2_cache            = items['L2 cache']
    cpu.numa_node0_cpu_s    = items['NUMA node0 CPU(s)']
    cpu.save!
  end

  def memory(server)
    memory = server.memories.first_or_create

    url = "http://#{server.ip_address}:9999/memory_info"
    response = Net::HTTP.get_response(URI.parse(url))
    items = JSON.parse(response.body)

    memory.mem_total          = items['MemTotal'].gsub(/\s+/m, "")
    memory.mem_free           = items['MemFree'].gsub(/\s+/m, "")
    memory.mem_available      = items['MemAvailable'].gsub(/\s+/m, "")
    memory.buffers            = items['Buffers'].gsub(/\s+/m, "")
    memory.cached             = items['Cached'].gsub(/\s+/m, "")
    memory.swap_cached        = items['SwapCached'].gsub(/\s+/m, "")
    memory.active             = items['Active'].gsub(/\s+/m, "")
    memory.inactive           = items['Inactive'].gsub(/\s+/m, "")
    memory.active_anon        = items['Active(anon)'].gsub(/\s+/m, "")
    memory.inactive_anon      = items['Inactive(anon)'].gsub(/\s+/m, "")
    memory.active_file        = items['Active(file)'].gsub(/\s+/m, "")
    memory.inactive_file      = items['Inactive(file)'].gsub(/\s+/m, "")
    memory.unevictable        = items['Unevictable'].gsub(/\s+/m, "")
    memory.mlocked            = items['Mlocked'].gsub(/\s+/m, "")
    memory.swap_total         = items['SwapTotal'].gsub(/\s+/m, "")
    memory.swap_free          = items['SwapFree'].gsub(/\s+/m, "")
    memory.dirty              = items['Dirty'].gsub(/\s+/m, "")
    memory.write_back         = items['Writeback'].gsub(/\s+/m, "")
    memory.anon_pages         = items['AnonPages'].gsub(/\s+/m, "")
    memory.mapped             = items['Mapped'].gsub(/\s+/m, "")
    memory.shmem              = items['Shmem'].gsub(/\s+/m, "")
    memory.slab               = items['Slab'].gsub(/\s+/m, "")
    memory.s_reclaimable      = items['SReclaimable'].gsub(/\s+/m, "")
    memory.s_unreclaim        = items['SUnreclaim'].gsub(/\s+/m, "")
    memory.kernel_stack       = items['KernelStack'].gsub(/\s+/m, "")
    memory.page_tables        = items['PageTables'].gsub(/\s+/m, "")
    memory.nfs_unstable       = items['NFS_Unstable'].gsub(/\s+/m, "")
    memory.bounce             = items['Bounce'].gsub(/\s+/m, "")
    memory.writeback_tmp      = items['WritebackTmp'].gsub(/\s+/m, "")
    memory.commit_limit       = items['CommitLimit'].gsub(/\s+/m, "")
    memory.committed_as       = items['Committed_AS'].gsub(/\s+/m, "")
    memory.vmalloc_total      = items['VmallocTotal'].gsub(/\s+/m, "")
    memory.vmalloc_used       = items['VmallocUsed'].gsub(/\s+/m, "")
    memory.vmalloc_chunk      = items['VmallocChunk'].gsub(/\s+/m, "")
    memory.hardware_corrupted = items['HardwareCorrupted'].gsub(/\s+/m, "")
    memory.anon_huge_pages    = items['AnonHugePages'].gsub(/\s+/m, "")
    memory.cma_total          = items['CmaTotal'].gsub(/\s+/m, "")
    memory.cma_free           = items['CmaFree'].gsub(/\s+/m, "")
    memory.huge_pages_total   = items['HugePages_Total'].gsub(/\s+/m, "")
    memory.huge_pages_free    = items['HugePages_Free'].gsub(/\s+/m, "")
    memory.huge_pages_rsvd    = items['HugePages_Rsvd'].gsub(/\s+/m, "")
    memory.huge_pages_surp    = items['HugePages_Surp'].gsub(/\s+/m, "")
    memory.hugepagesize       = items['Hugepagesize'].gsub(/\s+/m, "")
    memory.direct_map_4k      = items['DirectMap4k'].gsub(/\s+/m, "")
    memory.direct_map_2M      = items['DirectMap2M'].gsub(/\s+/m, "")
    memory.direct_map_1G      = items['DirectMap1G'].gsub(/\s+/m, "")
    memory.save!
  end

  def load_avg(server)
    load_avg = server.load_avgs.first_or_create

    url = "http://#{server.ip_address}:9999/load_avg"
    response = Net::HTTP.get_response(URI.parse(url))
    items = JSON.parse(response.body)

    load_avg.one_min_avg      = items['1_min_avg']
    load_avg.five_min_avg     = items['5_min_avg']
    load_avg.fifteen_min_avg  = items['15_min_avg']
    load_avg.save!
  end

  def bandwidth(server)
    url = "http://#{server.ip_address}:9999/bandwidth"
    response = Net::HTTP.get_response(URI.parse(url))
    items = JSON.parse(response.body)

    items.each do |item|
      bandwidth = server.bandwidths.where(interface: item['interface']).first_or_create
      bandwidth.interface = item['interface']
      bandwidth.tx        = item['tx']
      bandwidth.rx        = item['rx']
      bandwidth.save!
    end
  end

  def io(server)
    url = "http://#{server.ip_address}:9999/io_stats"
    response = Net::HTTP.get_response(URI.parse(url))
    items = JSON.parse(response.body)

    items.each do |item|
      io = server.ios.where(device: item['device']).first_or_create
      io.device       = item['device']
      io.reads        = item['reads']
      io.writes       = item['writes']
      io.in_progress  = item['in_progress']
      io.time_in_io   = item['time_in_io']
      io.save!
    end
  end
end
