name "simple_consul_alerts"
version "0.0.2"
maintainer "ocowchun"
maintainer_email "ocowchun@gmail.com"
license  "MIT"
supports "ubuntu"
description "install consul alert"
long_description IO.read(File.join(File.dirname(__FILE__), "README.md"))

depends 'apt'
depends 'golang'
depends 'poise-service', '~> 1.0.3'