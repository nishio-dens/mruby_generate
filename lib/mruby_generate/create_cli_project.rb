# frozen_string_literal: true

require 'erb'
require 'fileutils'

module MRubyGenerate
  class CreateCliProject
    attr_reader :project_name, :your_name

    TEMPLATE_FILES = %w[
      README.md
      LICENSE
      build_config.rb
      Rakefile
      your_project.gem
      mrbgem.rake
      mrblib/mrb_your_project.rb
      tools/your_project/mrb_your_project.c
    ].freeze

    def initialize(project_name)
      @project_name = project_name
      @your_name = `git config --global --get user.name`.strip
      @template_path = File.expand_path('../../templates/cli_project', __dir__)
      @dest_path = @project_name
    end

    def create
      create_and_copy_template_dir
      apply_templates
      rename_files
    end

    private

    def create_and_copy_template_dir
      FileUtils.cp_r @template_path, @project_name
    end

    def apply_templates
      TEMPLATE_FILES.each do |path|
        full_path = File.join(@dest_path, path)
        t = File.read(full_path)
        File.open(full_path, 'w') { |f| f << ERB.new(t).result(binding) }
      end
    end

    def rename_files
      FileUtils.mkdir File.join(@project_name, "tools", @project_name)

      [
        [File.join(@project_name, 'your_project.gem'), File.join(@project_name, "#{project_name}.gem")],
        [File.join(@project_name, 'mrblib', 'mrb_your_project.rb'), File.join(@project_name, 'mrblib', "mrb_#{project_name}.rb")],
        [File.join(@project_name, 'tools', 'your_project', 'mrb_your_project.c'), File.join(@project_name, 'tools', @project_name, "mrb_#{project_name}.c")]
      ].each { |from, to| FileUtils.mv(from, to) }

      FileUtils.rmdir File.join(@project_name, "tools", "your_project")
    end
  end
end
