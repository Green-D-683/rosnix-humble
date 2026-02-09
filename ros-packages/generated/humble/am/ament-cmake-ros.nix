{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  domain-coordinator,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_cmake_ros";
  version = "0.10.0-3";
  src = finalAttrs.passthru.sources."ament_cmake_ros";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest domain-coordinator ];
  propagatedBuildInputs = [ ament-cmake ament-cmake-gmock ament-cmake-gtest ament-cmake-pytest domain-coordinator ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "ament_cmake_ros" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_ros-source";
        url = "https://github.com/ros2-gbp/ament_cmake_ros-release.git";
        rev = "6acf4d960db2b92025ba4ca3e86b5d5240f817d1";
        hash = "sha256-fCRDap4nVGju+HLPT86v9gsHtGkQq/S3TyttMg+ykbI=";
      };
    };
  });
  meta = {
    description = "The ROS specific CMake bits in the ament buildsystem.";
  };
})
