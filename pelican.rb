require "formula"

class Pelican < Formula
  homepage 'http://blog.getpelican.com/'
  url 'https://pypi.python.org/packages/source/p/pelican/pelican-3.3.tar.gz'
  sha1 'bce8d56ac0d8fb065a9b06bd6764c85c4ec5519a'

  depends_on :python

  resource 'feedgenerator' do
      url 'https://pypi.python.org/packages/source/f/feedgenerator/feedgenerator-1.7.tar.gz'
      sha1 '56ca2dc406551d7f30952f064bc759131150b149'
  end

  resource 'jinja2' do
      url 'https://pypi.python.org/packages/source/J/Jinja2/Jinja2-2.7.2.tar.gz'
      sha1 '1ce4c8bc722444ec3e77ef9db76faebbd17a40d8'
  end

  resource 'pygments' do
      url 'https://pypi.python.org/packages/source/P/Pygments/Pygments-1.6.tar.gz'
      sha1 '53d831b83b1e4d4f16fec604057e70519f9f02fb'
  end

  resource 'docutils' do
      url 'https://pypi.python.org/packages/source/d/docutils/docutils-0.11.tar.gz'
      sha1 '3894ebcbcbf8aa54ce7c3d2c8f05460544912d67'
  end
 
  resource 'pytz' do
      url 'https://pypi.python.org/packages/source/p/pytz/pytz-2013.9.tar.gz'
      sha1 'd38d7f1480664b63c951cbec5fcc82bb6d02faf6'
  end

  resource 'blinker' do
      url 'https://pypi.python.org/packages/source/b/blinker/blinker-1.3.tar.gz'
      sha1 '8b9cce8010f47014c86cf8a6eb16f840123a1dba'
  end

  resource 'unidecode' do
      url 'https://pypi.python.org/packages/source/U/Unidecode/Unidecode-0.04.14.tar.gz'
      sha1 '872eeff5f97b4c1270693443ea16561e8f67a1ec'
  end

  resource 'six' do
      url 'https://pypi.python.org/packages/source/s/six/six-1.5.2.tar.gz'
      sha1 '90128862139a79d10cf213b3baad9c6e2f72fc78'
  end

  resource 'markupsafe' do
      url 'https://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-0.18.tar.gz'
      sha1''
  end

  def install
    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]

    resource('feedgenerator').stage { system "python", *install_args }
    resource('jinja2').stage { system "python", *install_args }
    resource('pygments').stage { system "python", *install_args }
    resource('docutils').stage { system "python", *install_args }
    resource('pytz').stage { system "python", *install_args }
    resource('blinker').stage { system "python", *install_args }
    resource('unidecode').stage { system "python", *install_args }
    resource('six').stage { system "python", *install_args }
    resource('markupsafe').stage { system "python", *install_args }

    system "python", "setup.py", "install", "--prefix=#{prefix}"
    #system "python", "setup.py", "install"

    bin.env_script_all_files(libexec+'bin', :PYTHONPATH => ENV['PYTHONPATH'])
  end

end
