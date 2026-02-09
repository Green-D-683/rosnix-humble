{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  as2-core,
  as2-gazebo-assets,
  as2-msgs,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "as2_platform_gazebo";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_platform_gazebo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ as2-core as2-gazebo-assets as2-msgs geometry-msgs rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ as2-core as2-gazebo-assets as2-msgs geometry-msgs rclcpp ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "as2_platform_gazebo" = substituteSource {
      src = fetchgit {
        name = "as2_platform_gazebo-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "584a5c8d089ac213354f668889077a65908054cd";
        hash = "sha256-/Y7ikIMnXDMZ2MCL3BtUbfKi6Jcvt3V3GQA9OmQDrkI=";
      };
    };
  });
  meta = {
    description = "Package to communicate Gazebo Simulator with Aerostack2 framework";
  };
})
