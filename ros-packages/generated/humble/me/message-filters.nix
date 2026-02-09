{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-python,
  ament-cmake-ros,
  ament-lint-auto,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  python-cmake-module,
  rclcpp,
  rclcpp-lifecycle,
  rclpy,
  rcutils,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "message_filters";
  version = "4.3.12-1";
  src = finalAttrs.passthru.sources."message_filters";
  nativeBuildInputs = [ ament-cmake-python ament-cmake-ros python-cmake-module ];
  propagatedNativeBuildInputs = [ builtin-interfaces rclcpp rclpy rcutils ];
  buildInputs = [ ament-cmake-python ament-cmake-ros python-cmake-module ];
  propagatedBuildInputs = [ builtin-interfaces rclcpp rclpy rcutils ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto rclcpp-lifecycle sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "message_filters" = substituteSource {
      src = fetchgit {
        name = "message_filters-source";
        url = "https://github.com/ros2-gbp/ros2_message_filters-release.git";
        rev = "afeef7f133d24865875471bc841c707923e68400";
        hash = "sha256-E5xzhNU/dFEj1Uutl3gNJwB3zH7n4BnkiRlXVkyw1dE=";
      };
    };
  });
  meta = {
    description = "\n    A set of ROS2 message filters which take in messages and may output those messages at a later time, based on the conditions that filter needs met.\n  ";
  };
})
