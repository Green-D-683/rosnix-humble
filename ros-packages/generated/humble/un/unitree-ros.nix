{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "unitree_ros";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."unitree_ros";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclcpp rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp rosidl-default-generators rosidl-default-runtime sensor-msgs std-msgs tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "unitree_ros" = substituteSource {
      src = fetchgit {
        name = "unitree_ros-source";
        url = "https://github.com/ros2-gbp/unitree_ros-release.git";
        rev = "05c1589f42e72894bbf78108b4f3ec6d7585b3df";
        hash = "sha256-8Rfp2FeF+/MKJy4zX2MXdo8++BRbCcPZA3Cmhb+60GE=";
      };
    };
  });
  meta = {
    description = "Unitree ros package";
  };
})
