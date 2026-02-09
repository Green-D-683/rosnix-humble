{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-industrial-cmake-boilerplate,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "boost_plugin_loader";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."boost_plugin_loader";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ros-industrial-cmake-boilerplate ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-filesystem" "libboost-filesystem-dev" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ros-industrial-cmake-boilerplate ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-filesystem" "libboost-filesystem-dev" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "boost_plugin_loader" = substituteSource {
      src = fetchgit {
        name = "boost_plugin_loader-source";
        url = "https://github.com/tesseract-robotics-release/boost_plugin_loader-release.git";
        rev = "5a80dc29c763973528487223b7ed76b46df32cf9";
        hash = "sha256-1afsK+kiBjKItDgVIlXMFK8S/Z6lzo7R9MWYxDNcgzo=";
      };
    };
  });
  meta = {
    description = "Boost plugin loader implementation";
  };
})
