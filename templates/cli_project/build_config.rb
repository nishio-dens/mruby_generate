def gem_config(conf)
  conf.gem File.expand_path(File.dirname(__FILE__))
end

MRuby::Build.new do |conf|
  toolchain :gcc

  conf.enable_test

  if ENV['DEBUG'] == 'true'
    conf.enable_debug
    conf.cc.defines = %w(MRB_ENABLE_DEBUG_HOOK)
    conf.gem core: 'mruby-bin-debugger'
  end

  gem_config(conf)
end
