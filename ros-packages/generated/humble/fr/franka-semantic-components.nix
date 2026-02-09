{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-clang-tidy,
  ament-cmake-copyright,
  ament-cmake-cppcheck,
  ament-cmake-flake8,
  ament-cmake-gmock,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-xmllint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  franka-hardware,
  franka-msgs,
  geometry-msgs,
  hardware-interface,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "franka_semantic_components";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."franka_semantic_components";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ franka-hardware franka-msgs geometry-msgs hardware-interface rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ franka-hardware franka-msgs geometry-msgs hardware-interface rclcpp sensor-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-clang-tidy ament-cmake-copyright ament-cmake-cppcheck ament-cmake-flake8 ament-cmake-gmock ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-xmllint ];
  passthru.sources = mkSourceSet (sources: {
    "franka_semantic_components" = substituteSource {
      src = fetchgit {
        name = "franka_semantic_components-source";
        url = "https://github.com/ros2-gbp/franka_ros2-release.git";
        rev = "52c4717bd5617be5952aaa48b878530482c8bd63";
        hash = "sha256-H791BA4rQ/0EVJm1jvujIiunpZneSDBEKIo3L/WXJpE=";
      };
    };
  });
  meta = {
    description = "franka_semantic_components provides semantic components for using Franka Robotics research robots with ros2_control";
  };
})
