class Ruby193 < FPM::Cookery::Recipe
  description 'The Ruby virtual machine'

  name 'ruby'
  version '1:1.9.3.545'
  revision 0
  homepage 'http://www.ruby-lang.org/'
  source 'http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p545.tar.gz'
  md5 '8e8f6e4d7d0bb54e0edf8d9c4120f40c'

  section 'interpreters'

  build_depends 'rpmdevtools',
                'libffi-devel',
                'autoconf',
                'bison',
                'libxml2-devel',
                'libxslt-devel',
                'openssl-devel',
                'gdbm-devel',
                'zlib-devel',
                'libyaml',
                'libyaml-devel'
  depends 'zlib',
          'libffi',
          'gdbm',
          'libyaml',
          'openssl'

  def build
    configure :prefix => prefix, 'disable-install-doc' => true
    make
  end

  def install
    make :install, 'DESTDIR' => destdir
  end
end
