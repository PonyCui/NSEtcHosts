

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "NSEtcHosts"
  s.version      = "1.0.2"
  s.summary      = "/etc/hosts with NSURLRequest All networking library are compatible."

  s.description  = <<-DESC
                   /etc/hosts with NSURLRequest All networking library are compatible. 应用内实现域名Host绑定，开发利器。
                   DESC

  s.homepage     = "https://github.com/louis-cai/PPEtcHosts"

  s.license      = "MIT"

  s.author       = "PonyCui"

  s.platform     = :ios

  s.source       = { :git => "git@github.com:louis-cai/PPEtcHosts.git", :tag => "1.0.2" }

  s.source_files  = "Src", "Src/*.{h,m}"

  s.requires_arc = true

end
