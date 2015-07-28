class Slowmovideo < Formula
  desc "Creates slow-motion videos by interpollating from optical flow"
  homepage "https://github.com/slowmoVideo/slowmoVideo/wiki"
  url "https://github.com/slowmoVideo/slowmoVideo/archive/v0.4.tar.gz"
  sha256 "06adca2d864c3afff26ab5ac0eda1d3cb2ebf93d580de3d668f6136e1a3d3bd2"

  depends_on "cmake" => :build
  depends_on "glew"
  depends_on "jpeg"
  depends_on "libpng"
  depends_on "opencv"
  depends_on "qt4"
  depends_on "ffmpeg"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    system "cmake", "src/.", *std_cmake_args
    system "make"
    system "make", "install"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test slowmovideo`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
