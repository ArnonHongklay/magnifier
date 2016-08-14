# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160130050947) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "name",                   limit: 255, default: "",    null: false
    t.boolean  "admin",                              default: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_accounts_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true, using: :btree
  end

  create_table "arps", force: :cascade do |t|
    t.integer  "server_id"
    t.string   "address",    limit: 255
    t.string   "hw_type",    limit: 255
    t.string   "hw_address", limit: 255
    t.string   "flags",      limit: 255
    t.string   "mask",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["server_id"], name: "index_arps_on_server_id", using: :btree
  end

  create_table "bandwidths", force: :cascade do |t|
    t.integer  "server_id"
    t.string   "interface",  limit: 255
    t.string   "tx",         limit: 255
    t.string   "rx",         limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["server_id"], name: "index_bandwidths_on_server_id", using: :btree
  end

  create_table "bloggy_posts", force: :cascade do |t|
    t.integer  "posts_revision_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bloggy_posts_revisions", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "url"
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["id"], name: "index_bloggy_posts_revisions_on_id", unique: true, using: :btree
    t.index ["post_id"], name: "index_bloggy_posts_revisions_on_post_id", using: :btree
    t.index ["published_at"], name: "index_bloggy_posts_revisions_on_published_at", using: :btree
  end

  create_table "bloggy_tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "bloggy_users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cpus", force: :cascade do |t|
    t.integer  "server_id"
    t.string   "architecture",        limit: 255
    t.string   "cpu_op_mode_s",       limit: 255
    t.string   "byte_order",          limit: 255
    t.string   "cpu_s",               limit: 255
    t.string   "on_line_cpu_s_list",  limit: 255
    t.string   "thread_s_per_core",   limit: 255
    t.string   "core_s_per_socket",   limit: 255
    t.string   "socket_s",            limit: 255
    t.string   "numa_node_s",         limit: 255
    t.string   "vendor_id",           limit: 255
    t.string   "cpu_family",          limit: 255
    t.string   "model",               limit: 255
    t.string   "m_name",              limit: 255
    t.string   "stepping",            limit: 255
    t.string   "cpu_mhz",             limit: 255
    t.string   "bogo_mips",           limit: 255
    t.string   "virtualization",      limit: 255
    t.string   "hypervisor_vendor",   limit: 255
    t.string   "virtualization_type", limit: 255
    t.string   "l1d_cache",           limit: 255
    t.string   "l1i_cache",           limit: 255
    t.string   "l2_cache",            limit: 255
    t.string   "numa_node0_cpu_s",    limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["server_id"], name: "index_cpus_on_server_id", using: :btree
  end

  create_table "disks", force: :cascade do |t|
    t.integer  "server_id"
    t.string   "file_system",  limit: 255
    t.string   "size",         limit: 255
    t.string   "used",         limit: 255
    t.string   "avail",        limit: 255
    t.string   "used_percent", limit: 255
    t.string   "mounted",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["server_id"], name: "index_disks_on_server_id", using: :btree
  end

  create_table "ios", force: :cascade do |t|
    t.integer  "server_id"
    t.string   "device",      limit: 255
    t.string   "reads",       limit: 255
    t.string   "writes",      limit: 255
    t.string   "in_progress", limit: 255
    t.string   "time_in_io",  limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["server_id"], name: "index_ios_on_server_id", using: :btree
  end

  create_table "load_avgs", force: :cascade do |t|
    t.integer  "server_id"
    t.string   "one_min_avg",     limit: 255
    t.string   "five_min_avg",    limit: 255
    t.string   "fifteen_min_avg", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["server_id"], name: "index_load_avgs_on_server_id", using: :btree
  end

  create_table "memories", force: :cascade do |t|
    t.integer  "server_id"
    t.string   "mem_total",          limit: 255
    t.string   "mem_free",           limit: 255
    t.string   "mem_available",      limit: 255
    t.string   "buffers",            limit: 255
    t.string   "cached",             limit: 255
    t.string   "swap_cached",        limit: 255
    t.string   "active",             limit: 255
    t.string   "inactive",           limit: 255
    t.string   "active_anon",        limit: 255
    t.string   "inactive_anon",      limit: 255
    t.string   "active_file",        limit: 255
    t.string   "inactive_file",      limit: 255
    t.string   "unevictable",        limit: 255
    t.string   "mlocked",            limit: 255
    t.string   "swap_total",         limit: 255
    t.string   "swap_free",          limit: 255
    t.string   "dirty",              limit: 255
    t.string   "write_back",         limit: 255
    t.string   "anon_pages",         limit: 255
    t.string   "mapped",             limit: 255
    t.string   "shmem",              limit: 255
    t.string   "slab",               limit: 255
    t.string   "s_reclaimable",      limit: 255
    t.string   "s_unreclaim",        limit: 255
    t.string   "kernel_stack",       limit: 255
    t.string   "page_tables",        limit: 255
    t.string   "nfs_unstable",       limit: 255
    t.string   "bounce",             limit: 255
    t.string   "writeback_tmp",      limit: 255
    t.string   "commit_limit",       limit: 255
    t.string   "committed_as",       limit: 255
    t.string   "vmalloc_total",      limit: 255
    t.string   "vmalloc_used",       limit: 255
    t.string   "vmalloc_chunk",      limit: 255
    t.string   "hardware_corrupted", limit: 255
    t.string   "anon_huge_pages",    limit: 255
    t.string   "cma_total",          limit: 255
    t.string   "cma_free",           limit: 255
    t.string   "huge_pages_total",   limit: 255
    t.string   "huge_pages_free",    limit: 255
    t.string   "huge_pages_rsvd",    limit: 255
    t.string   "huge_pages_surp",    limit: 255
    t.string   "hugepagesize",       limit: 255
    t.string   "direct_map_4k",      limit: 255
    t.string   "direct_map_2M",      limit: 255
    t.string   "direct_map_1G",      limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["server_id"], name: "index_memories_on_server_id", using: :btree
  end

  create_table "notificats", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "subject"
    t.string   "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_notificats_on_account_id", using: :btree
  end

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  create_table "servers", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "hostname",   limit: 255
    t.string   "os",         limit: 255
    t.string   "uptime",     limit: 255
    t.string   "datetime",   limit: 255
    t.string   "ip_address", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["account_id"], name: "index_servers_on_account_id", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255, null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
    t.index ["updated_at"], name: "index_sessions_on_updated_at", using: :btree
  end

end
