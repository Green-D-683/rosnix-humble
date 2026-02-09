{
  ament-cmake-gmock,
  ament-cmake-ros,
  ament-cmake-version,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcutils,
  rosSystemPackages,
  rosidl-runtime-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw";
  version = "6.1.2-1";
  src = finalAttrs.passthru.sources."rmw";
  nativeBuildInputs = [ ament-cmake-ros ament-cmake-version ];
  propagatedNativeBuildInputs = [ rcutils rosidl-runtime-c ];
  buildInputs = [ ament-cmake-ros ament-cmake-version ];
  propagatedBuildInputs = [ rcutils rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common osrf-testing-tools-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw" = substituteSource {
      src = fetchgit {
        name = "rmw-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "7d99635f205633dc7d85cb41cb59d4ca99132fb6";
        hash = "sha256-RGeLoc5aMdmxKPjtJ+eX4wGkEoWVO6oH1j0nOFqw/6w=";
      };
    };
  });
  meta = {
    description = "Contains the ROS middleware API.";
  };
})
