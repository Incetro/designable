Pod::Spec.new do |spec|
  spec.name          = 'incetro-designable'
  spec.module_name   = 'Designable'
  spec.version       = '1.0.1'
  spec.license       = 'MIT'
  spec.authors       = { 'incetro' => 'incetro@ya.ru' }
  spec.homepage      = "https://github.com/Incetro/designable.git"
  spec.summary       = 'A "Designable" approach helper which we use for designing any views'

  spec.ios.deployment_target     = "12.1"
  spec.tvos.deployment_target    = "12.1"

  spec.swift_version = '5.3'
  spec.source        = { git: "https://github.com/Incetro/designable.git", tag: "#{spec.version}" }
  spec.source_files  = "Sources/Designable/**/*.{h,swift}"
  spec.dependency 'incetro-observer-list'
end