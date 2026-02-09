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
  pname = "ros_industrial_cmake_boilerplate";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."ros_industrial_cmake_boilerplate";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cppcheck" "gtest" "iwyu" "lcov" "libclang-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros_industrial_cmake_boilerplate" = substituteSource {
      src = fetchgit {
        name = "ros_industrial_cmake_boilerplate-source";
        url = "https://github.com/ros2-gbp/ros_industrial_cmake_boilerplate-release.git";
        rev = "35398618a1d0516c78e430b82eae0ac778c7d64e";
        hash = "sha256-rNr5ptlVmpZBVnjrfrX2w0kU2Evi+PxLWKfvzffxTnY=";
      };
    };
  });
  meta = {
    description = "Contains boilerplate cmake script, macros and utils";
  };
})
