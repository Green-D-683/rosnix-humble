{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libcurl-vendor,
  mkSourceSet,
  python-cmake-module,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "resource_retriever";
  version = "3.1.3-1";
  src = finalAttrs.passthru.sources."resource_retriever";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-index-cpp ament-index-python libcurl-vendor ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp ament-index-python libcurl-vendor ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common python-cmake-module ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "resource_retriever" = substituteSource {
      src = fetchgit {
        name = "resource_retriever-source";
        url = "https://github.com/ros2-gbp/resource_retriever-release.git";
        rev = "4656692da8b3a3ff1c8de629ffce9cf0067972e0";
        hash = "sha256-5hKLMkTBhAFO+J0BxfFlwoshhh8OCMWdQldDNgWmWSY=";
      };
    };
  });
  meta = {
    description = "\n   This package retrieves data from url-format files such as http://,\n   ftp://, package:// file://, etc., and loads the data into memory.\n   The package:// url for ros packages is translated into a local\n   file:// url.  The resourse retriever was initially designed to load\n   mesh files into memory, but it can be used for any type of\n   data. The resource retriever is based on the the libcurl library.\n  ";
  };
})
