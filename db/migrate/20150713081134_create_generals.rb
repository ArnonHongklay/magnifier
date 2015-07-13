class CreateGenerals < ActiveRecord::Migration
  def up
    create_table :cpus do |t|
      t.string :architecture
      t.string :cpu_op_mode_s
      t.string :byte_order
      t.string :cpu_s
      t.string :on_line_cpu_s_list
      t.string :thread_s_per_core
      t.string :core_s_per_socket
      t.string :socket_s
      t.string :numa_node_s
      t.string :vendor_id
      t.string :cpu_family
      t.string :model
      t.string :model_name
      t.string :stepping
      t.string :cpu_mhz
      t.string :bogo_mips
      t.string :virtualization
      t.string :hypervisor_vendor
      t.string :virtualization_type
      t.string :l1d_cache
      t.string :l1i_cache
      t.string :l2_cache
      t.string :numa_node0_cpu_s

      t.timestamps null: false
    end

    create_table :memories do |t|
      t.string :mem_total
      t.string :mem_free
      t.string :mem_available
      t.string :buffers
      t.string :cached
      t.string :swap_cached
      t.string :active
      t.string :inactive
      t.string :active_anon
      t.string :inactive_anon
      t.string :active_file
      t.string :inactive_file
      t.string :unevictable
      t.string :mlocked
      t.string :swap_total
      t.string :swap_free
      t.string :dirty
      t.string :write_back
      t.string :anon_pages
      t.string :mapped
      t.string :shmem
      t.string :slab
      t.string :s_reclaimable
      t.string :s_unreclaim
      t.string :kernel_stack
      t.string :page_tables
      t.string :nfs_unstable
      t.string :bounce
      t.string :writeback_tmp
      t.string :commit_limit
      t.string :committed_as
      t.string :vmalloc_total
      t.string :vmalloc_used
      t.string :vmalloc_chunk
      t.string :hardware_corrupted
      t.string :anon_huge_pages
      t.string :cma_total
      t.string :cma_free
      t.string :huge_pages_total
      t.string :huge_pages_free
      t.string :huge_pages_rsvd
      t.string :huge_pages_surp
      t.string :hugepagesize
      t.string :direct_map_4k
      t.string :direct_map_2M
      t.string :direct_map_1G

      t.timestamps null: false
    end

    create_table :disks do |t|
      t.string :file_system
      t.string :size
      t.string :used
      t.string :avail
      t.string :used_percent
      t.string :mounted

      t.timestamps null: false
    end

    create_table :arps do |t|
      t.string :address
      t.string :hw_type
      t.string :hw_address
      t.string :flags
      t.string :mask

      t.timestamps null: false
    end

    create_table :bandwidths do |t|
      t.string :interface
      t.string :tx
      t.string :rx

      t.timestamps null: false
    end

    create_table :ios do |t|
      t.string :device
      t.string :reads
      t.string :writes
      t.string :in_progress
      t.string :time_in_io

      t.timestamps null: false
    end

    create_table :load_avgs do |t|
      t.string :one_min_avg
      t.string :five_min_avg
      t.string :fifteen_min_avg

      t.timestamps null: false
    end

    create_table :generals do |t|
      t.belongs_to  :account,   index: true
      t.string      :hostname
      t.string      :os
      t.string      :uptime
      t.string      :datetime
      t.string      :ip_address
      t.belongs_to  :cpu,       index: true
      t.belongs_to  :memory,    index: true
      t.belongs_to  :disk,      index: true
      t.belongs_to  :arp,       index: true
      t.belongs_to  :bandwidth, index: true
      t.belongs_to  :io,        index: true
      t.belongs_to  :load_avg,  index: true

      t.timestamps null: false
    end
  end

  def down
    drop_table :cpus
    drop_table :memories
    drop_table :disks
    drop_table :arps
    drop_table :bandwidths
    drop_table :ios
    drop_table :load_avgs
    drop_table :generals
  end
end
