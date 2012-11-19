require "bini"
require "bini/dm/version"
require "data_mapper"
require "dm-migrations"

module Bini
  module DM
    extend self

    def db_path
      FileUtils.mkdir_p Bini.config_dir if !Dir.exist? Bini.config_dir
      "#{Bini.config_dir}/#{Bini.long_name}.db"
    end

    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, "sqlite://#{db_path}")

    %w{file image}.each do |f|
      require "bini/dm/models/#{f}"
    end

    DataMapper.auto_upgrade!
  end
end

module DataMapper
  class Collection
    def rand
      all[Random.rand(all.count)]
    end
  end
end

