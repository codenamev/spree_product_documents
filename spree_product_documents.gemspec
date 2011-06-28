Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_product_documents'
  s.version     = '0.60.0'
  s.summary     = 'Add documents to products'
  s.description = 'Currently supports: MS Word, MS Excel, PDF'
  s.required_ruby_version = '>= 1.8.7'

  s.authors           = ['Mosaic Interactive']
  s.email             = 'developers@mosaicwebsite.com'
  s.homepage          = 'http://github.com/mosaic/spree_product_documents'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.has_rdoc = false

  s.add_dependency('spree_core', '>= 0.40.0')
end
