require "formula"

class AllmydataTahoe < Formula
  homepage "https://tahoe-lafs.org/"
  url "https://tahoe-lafs.org/source/tahoe-lafs/releases/allmydata-tahoe-1.10.0.tar.bz2"
  sha1 "9932ddc1d364a1efe8afddf83572b4de0329f1fc"

  depends_on :python
  depends_on 'openssl'

  resource 'pycrypto' do
    url 'https://pypi.python.org/packages/source/p/pycrypto/pycrypto-2.6.tar.gz'
    sha1 'c17e41a80b3fbf2ee4e8f2d8bb9e28c5d08bbb84'
  end

  resource 'zope-interface' do
    url 'https://pypi.python.org/packages/source/z/zope.interface/zope.interface-4.0.5.zip'
    sha1 '0a626c371a3321c196dd6e8687859cb0524c854b'
  end

  resource 'twisted' do
    url 'https://pypi.python.org/packages/source/T/Twisted/Twisted-13.2.0.tar.bz2'
    sha1 'e1d43645fd3d84dc2867f36b60d2e469a71eb01d'
  end

  resource 'pyasn1' do
    url 'https://pypi.python.org/packages/source/p/pyasn1/pyasn1-0.1.7.tar.gz'
    sha1 'e32b91c5a5d9609fb1d07d8685a884bab22ca6d0'
  end

  resource 'pycryptopp' do
    url 'https://pypi.python.org/packages/source/p/pycryptopp/pycryptopp-0.6.0.1206569328141510525648634803928199668821045408958.tar.gz'
    sha1 '773008d41d5c135a5bd899cd4c4a51ee54a97e39'
  end

  resource 'foolscap' do
    url 'https://pypi.python.org/packages/source/f/foolscap/foolscap-0.6.4.tar.gz'
    sha1 'fc705bf300dd54c6d8ec857db39d7aec08760ccb'
  end

  resource 'zfec' do
    url 'https://pypi.python.org/packages/source/z/zfec/zfec-1.4.24.tar.gz'
    sha1 '99b334431209332a14f0531de252aee3de18c948'
  end

  resource 'pyopenssl' do
    url 'https://pypi.python.org/packages/source/p/pyOpenSSL/pyOpenSSL-0.13.1.tar.gz'
    sha1 '60633ebb821d48d7132a436c897288ec0121b892'
  end

  resource 'pyutil' do
    url 'https://pypi.python.org/packages/source/p/pyutil/pyutil-1.9.7.tar.gz'
    sha1 '2a2b44d7b77b12c1d37dca30509f9470df2adae2'
  end

  resource 'argparse' do
    url 'http://argparse.googlecode.com/files/argparse-1.2.1.tar.gz'
    sha1 'caadac82aa2576d6b445058c1fcf6ef0b14dbaa1'
  end

  resource 'zbase32' do
    url 'https://pypi.python.org/packages/source/z/zbase32/zbase32-1.1.5.tar.gz'
    sha1 '1cbf1144b953fb299e189ef9d06066456f30a1e3'
  end

  resource 'mock' do
    url 'https://pypi.python.org/packages/source/m/mock/mock-1.0.1.tar.gz'
    sha1 'ba2b1d5f84448497e14e25922c5e3293f0a91c7e'
  end

  resource 'nevow' do
    url 'https://pypi.python.org/packages/source/N/Nevow/Nevow-0.10.0.tar.gz'
    sha1 '134c795581df70649d0c11d8619b8b4e7d3749e6'
  end

  resource 'simplejson' do
    url 'https://pypi.python.org/packages/source/s/simplejson/simplejson-3.3.2.tar.gz'
    sha1 'd8b5e6ddcbf389c6a3fb86717a86a862177705c6'
  end


  def install
    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]

    resource('pycrypto').stage { system "python", *install_args }
    resource('zope-interface').stage { system "python", *install_args }
    resource('twisted').stage { system "python", *install_args }
    resource('pyasn1').stage { system "python", *install_args }
    resource('pycryptopp').stage { system "python", *install_args }
    resource('foolscap').stage { system "python", *install_args }
    resource('zfec').stage { system "python", *install_args }
    resource('pyopenssl').stage { system "python", *install_args }
    resource('pyutil').stage { system "python", *install_args }
    resource('argparse').stage { system "python", *install_args }
    resource('zbase32').stage { system "python", *install_args }
    resource('mock').stage { system "python", *install_args }
    resource('nevow').stage { system "python", *install_args }
    resource('simplejson').stage { system "python", *install_args }

    #run tests -- for debugging failures
    #system "python", "setup.py", "test", "-s", "allmydata"
    system "python", "setup.py", "install",  "--prefix=#{prefix}"

    bin.env_script_all_files(libexec+'bin', :PYTHONPATH => ENV['PYTHONPATH'])
  end

  test do
    system "#{bin}/tahoe", "--help"
  end
end
