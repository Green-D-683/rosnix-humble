{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "libcreate";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."libcreate";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libcreate" = substituteSource {
      src = fetchgit {
        name = "libcreate-source";
        url = "https://github.com/AutonomyLab/libcreate-release.git";
        rev = "2a01604fd598bf4c7d8e0fb20f72ee2f1856be14";
        hash = "sha256-81YWnHfZRcIQuODpLa8HygB8zaZczdlzUGxsbZWHzlI=";
      };
    };
  });
  meta = {
    description = "C++ library for interfacing with iRobot's Create 1 and Create 2";
  };
})
