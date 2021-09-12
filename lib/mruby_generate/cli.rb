# frozen_string_literal: true

require 'thor'

module MRubyGenerate
  class CLI < Thor
    map %w[--version -v] => :version

    desc 'new PROJECT_NAME', 'create new project'
    def new(project_name)
      CreateCliProject.new(project_name).create
    end

    desc 'version', 'print the version'
    def version
      require 'mruby_generate/version'
      puts "version #{MRubyGenerate::VERSION}"
    end
  end
end
