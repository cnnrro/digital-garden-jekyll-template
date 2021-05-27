module Jekyll
  class FaviconFile < StaticFile
    # Initialize a new FaviconFile.
    #
    # site - The Site.
    # base - The String path to the <source>.
    # sdir - The String path of the source directory of the file (rel <source>).
    # name - The String filename of the file.
    # ddir - The String path of the destination directory of the file.
    def initialize(site, base, sdir, name, ddir)
      super(site, base, sdir, name)
      @base = base
      @sdir = sdir
      @name = name
      @ddir = ddir || sdir
    end

    # Obtain destination path.
    #
    # dest - The String path to the destination dir.
    #
    # Returns destination file path.
    def destination(dest)
      File.join(dest, @ddir, @name)
    end
  end

  class FaviconGenerator < Jekyll::Generator
    def generate(site)
      Dir.glob('_favicons/*.*') do |file|
        site.static_files << FaviconFile.new(site, site.source, '_favicons/', File.basename(file), '/')
      end
    end
  end
end
