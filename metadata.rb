maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs and configures all aspects of apache2 using Debian style symlinks with helper definitions"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version           "0.12.3"

depends "aws"
depends "xfs"

