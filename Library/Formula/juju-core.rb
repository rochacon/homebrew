require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class JujuCore < Formula
  homepage 'https://launchpad.net/juju-core'
  url 'https://launchpad.net/juju-core/trunk/1.11.2/+download/juju-core_1.11.2.tar.gz'
  sha1 'd9579c3449711f24d3cd2ce251f1154bbfe490b9'

  depends_on 'go' => :build

  def install
    # set GOPATH to current working directory 
    ENV['GOPATH']=Dir.pwd # wtf

    # fixup the 1.11.2 tarball 
    system "mkdir", "-p", "src"
    system "mv", "code.google.com", "src"
    system "mv", "labix.org", "src"
    system "mv", "launchpad.net", "src"
    system "mv", "github.com", "src"

    
    system "go", "install", "-v", "launchpad.net/juju-core/cmd/juju"
    prefix.install(Dir['bin'])
  end

end
