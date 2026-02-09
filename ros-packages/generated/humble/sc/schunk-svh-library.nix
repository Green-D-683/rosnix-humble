{
  ament-cmake,
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "schunk_svh_library";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."schunk_svh_library";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "schunk_svh_library" = substituteSource {
      src = fetchgit {
        name = "schunk_svh_library-source";
        url = "https://github.com/ros2-gbp/schunk_svh_library-release.git";
        rev = "eb88f49a96664c56f57002f2564ab41a961d28e5";
        hash = "sha256-n1ECtIIlm0bPzlzsul/AH8CHSn5tXYbNJqbiCC9AuSs=";
      };
    };
  });
  meta = {
    description = "Standalone C++ library for accessing the Schunk five finger hand.";
  };
})
