require "bini/dm/version"
require "data_mapper"
require "dm-migrations"

module Bini
  module DM
    extend self

    def db_path
      FileUtils.mkdir_p Bini::App.config_dir if !Dir.exist? Bini::App.config_dir
      "#{Bini::App.config_dir}/#{Bini::App.name}.db"
    end

    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, "sqlite://#{db_path}")

    %w{file image}.each do |f|
      require "bini/models/dm/#{f}"
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

