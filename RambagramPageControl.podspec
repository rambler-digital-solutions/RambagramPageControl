Pod::Spec.new do |s|
  s.name          = "RambagramPageControl"
  s.version       = "1.0.0"
  s.summary       = "PageControl UI component ala Instagram. Interface Builder support. Fully interchangeable with old plain UIPageControl."
  s.license       = 'MIT'
  s.authors       = { "Ivan Kvyatkovskiy" => "ivan.kvyatkovski@gmail.com" }
  s.homepage      = "https://github.com/rambler-digital-solutions/RambagramPageControl"
  s.source        = { :git => "https://github.com/rambler-digital-solutions/RambagramPageControl.git", :tag => s.version.to_s }
  s.source_files = 'RambagramPageControl/Classes/**/*'
  s.platform      = :ios, "8.0"
  s.requires_arc  = true
  s.license       = { :type => 'MIT', :file => 'LICENSE' }
end

