require File.expand_path("../../Abstract/abstract-php-extension", __FILE__)

class Php70Uploadprogress < AbstractPhp70Extension
  init
  desc "Extension to track progress of a file upload."
  homepage "https://pecl.php.net/package/uploadprogress"
  url "https://git.php.net/repository/pecl/php/uploadprogress.git",
    :revision => "95d8a0fd4554e10c215d3ab301e901bd8f99c5d9"
  version "95d8a0f"
  head "https://git.php.net/repository/pecl/php/uploadprogress.git"

  depends_on "pcre"

  def install
    # Dir.chdir "uploadprogress-#{version}" unless build.head?

    ENV.universal_binary if build.universal?

    safe_phpize
    system "./configure", "--prefix=#{prefix}",
                            phpconfig
    system "make"
    prefix.install "modules/uploadprogress.so"
    write_config_file if build.with? "config-file"
  end
end
