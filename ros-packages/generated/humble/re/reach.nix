{
  boost-plugin-loader,
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
  pname = "reach";
  version = "1.6.0-1";
  src = finalAttrs.passthru.sources."reach";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ boost-plugin-loader ros-industrial-cmake-boilerplate ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" "libomp-dev" "libpcl-all-dev" "yaml-cpp" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ boost-plugin-loader ros-industrial-cmake-boilerplate ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libomp-dev" "libpcl-all-dev" "yaml-cpp" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "reach" = substituteSource {
      src = fetchgit {
        name = "reach-source";
        url = "https://github.com/ros2-gbp/reach-release.git";
        rev = "36d1ee8d158fc122621bd75070f6dc13c926fc30";
        hash = "sha256-+uOEQ0GsFTvN6B5Td+/Xi36Qe8fkzOCwmke7VrPHoJc=";
      };
    };
  });
  meta = {
    description = "The reach package";
  };
})
