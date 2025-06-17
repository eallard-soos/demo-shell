from conans import ConanFile, CMake

class HelloConan(ConanFile):
    name = "conan-library"
    version = "5.0.2"
    homepage = "http://soos.io"
    license = "MIT"

    def build(self):
        for bt in ("Debug", "Release"):
            cmake = CMake(self, build_type=bt)
            cmake.configure(source_folder="src")
            cmake.build()
            cmake.install()

    def requirements(self):
        self.requires("poco/[>1.0,<1.9]")
        self.requires('zlib/1.2.11')
        self.requires("openssl/3.0.7")
        self.requires("freetype/2.13.0")
        self.requires("rapidjson/cci.20200410")
        self.requires("fmt/9.1.0")
        self.requires("xz_utils/5.6.0")

    def build_requirements(self):
        self.tool_requires('7zip/19.00')
        self.tool_requires("cmake/3.22.6")
