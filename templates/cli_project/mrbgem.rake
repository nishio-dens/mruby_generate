MRuby::Gem::Specification.new('<%= @project_name %>') do |spec|
  spec.bins    = ['<%= @project_name %>']
  spec.license = 'MIT'
  spec.authors = '<%= @your_name %>'

  spec.add_dependency 'mruby-print', core: 'mruby-print'
end
