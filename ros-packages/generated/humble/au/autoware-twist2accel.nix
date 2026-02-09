{
  ament-cmake-auto,
  ament-cmake-ros,
  ament-lint-auto,
  autoware-cmake,
  autoware-lint-common,
  autoware-signal-processing,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  substituteSource,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_twist2accel";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_twist2accel";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-signal-processing geometry-msgs nav-msgs rclcpp rclcpp-components tf2 ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-signal-processing geometry-msgs nav-msgs rclcpp rclcpp-components tf2 ];
  checkInputs = [ ament-cmake-ros ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_twist2accel" = substituteSource {
      src = fetchgit {
        name = "autoware_twist2accel-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "98c67ed9f2fb8262ec4974906bf439c86217ed4d";
        hash = "sha256-mlvMkPn+v5r73/J7Cmn7GrIf8OyqMJKMp5C/lKJlliE=";
      };
    };
  });
  meta = {
    description = "The acceleration estimation package";
  };
})
