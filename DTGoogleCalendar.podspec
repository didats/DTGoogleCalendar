Pod::Spec.new do |spec|
  spec.name         = "DTGoogleCalendar"
  spec.version      = "0.0.1"
  spec.summary      = "Read Google Calendar Events"
  spec.description  = "Read Google Calendar Events on iOS with ease. This library will handle the login as well for you."
  spec.homepage     = "https://github.com/didats/DTGoogleCalendar"

  spec.license      = "MIT"

  spec.authors	    = { "Didats Triadi" => "didats@gmail.com" }

  spec.platform     = :ios
  spec.platform     = :ios, "10.0"

  spec.source       = { :git => "https://github.com/didats/DTGoogleCalendar.git", :tag => "#{spec.version}" }
  spec.swift_version = '5.0'

  spec.source_files  = "Source/**/*.swift"
  spec.static_framework = true

  spec.dependency 'DTSocialMediaLogin', '~> 0.0.4'

end