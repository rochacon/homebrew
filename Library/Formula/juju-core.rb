require 'formula'

VERSION='1.11.2'

class JujuCore < Formula
  homepage 'https://launchpad.net/juju-core'
  url "https://launchpad.net/juju-core/trunk/#{VERSION}/+download/juju-core_#{VERSION}.tar.gz"
  sha1 'd9579c3449711f24d3cd2ce251f1154bbfe490b9'

  depends_on 'go' => :build

  def install
    # set GOPATH to current working directory 
    ENV['GOPATH']=Dir.pwd

    # fixup the tarball, this is fixed in 1.11.3
    system "mkdir", "-p", "src"
    system "mv", "code.google.com", "src"
    system "mv", "labix.org", "src"
    system "mv", "launchpad.net", "src"
    system "mv", "github.com", "src"
    
    system "go", "install", "launchpad.net/juju-core/cmd/juju"
    prefix.install(Dir['bin'])
  end

  def caveats
    "You may run \"juju generate-config\" to setup your Juju environments config at ~/.juju/environments.yaml."
  end

  def test
    system "#{bin}/juju", "version"
  end
end
