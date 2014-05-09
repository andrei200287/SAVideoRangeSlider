Pod::Spec.new do |s|
  s.name         = "VideoRangeSlider.podspec"
  s.version      = "0.0.1"
  s.summary      = "VideoRangeSlider"
  s.homepage     = "https://github.com/andrei200287/SAVideoRangeSlider"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Andrei" => "andrei@solovjev.com" }
  s.platform     = :ios, "5.0"
  s.source       = { :git => "git@github.com:andrei200287/SAVideoRangeSlider.git", :tag => "0.0.1" }
  s.source_files = "SAVideoRangeSlider/*.{h,m}"
  s.frameworks = "MediaPlayer", "AVFoundation", "CoreMedia","QuartzCore"
end
