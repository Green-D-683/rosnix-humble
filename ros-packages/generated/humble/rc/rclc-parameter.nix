{
  ament-cmake-gtest,
  ament-cmake-pytest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rcl,
  rcl-interfaces,
  rclc,
  rclcpp,
  rcutils,
  rosSystemPackages,
  rosidl-runtime-c,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rclc_parameter";
  version = "4.0.2-3";
  src = finalAttrs.passthru.sources."rclc_parameter";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ builtin-interfaces rcl rcl-interfaces rclc rcutils rosidl-runtime-c ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ builtin-interfaces rcl rcl-interfaces rclc rcutils rosidl-runtime-c ];
  checkInputs = [ ament-cmake-gtest ament-cmake-pytest ament-lint-auto ament-lint-common example-interfaces osrf-testing-tools-cpp rclcpp std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rclc_parameter" = substituteSource {
      src = fetchgit {
        name = "rclc_parameter-source";
        url = "https://github.com/ros2-gbp/rclc-release.git";
        rev = "4981a19d8812cfa6ad12dd9f9a0999164daa0f37";
        hash = "sha256-hNrMl0ZtfBDAADc2AGZnof1swDjvr50+cLUgVoq4w6c=";
      };
    };
  });
  meta = {
    description = "Parameter server implementation for micro-ROS nodes";
  };
})
