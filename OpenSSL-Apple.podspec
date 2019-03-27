Pod::Spec.new do |s|
    openssl_version   = "1.1.1b"

    s.name            = "OpenSSL-Apple"
    s.version         = "#{openssl_version}"
    s.summary         = "A script for compiling OpenSSL for Apple Devices"
    s.authors         = "Felix Schulze", "Davide De Rosa"

    s.homepage        = "https://github.com/keystore-com/openssl-apple.git"
    s.source          = { :git => s.homepage.to_s, :tag => "master" }
    s.license         = { :type => 'Apache', :file => 'LICENSE' }

    s.prepare_command = <<-CMD
./build-libssl.sh --version=#{openssl_version}
./create-openssl-framework.sh dynamic
    CMD

    s.ios.deployment_target     = "10.0"
    s.ios.vendored_frameworks   = "frameworks/iPhone/openssl.framework"
    s.tvos.deployment_target    = "10.0"
    s.tvos.vendored_frameworks  = "frameworks/AppleTV/openssl.framework"
    s.osx.deployment_target     = "10.11"
    s.osx.vendored_frameworks   = "frameworks/MacOSX/openssl.framework"
    s.requires_arc              = false
end
