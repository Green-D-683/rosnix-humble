{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_cpp_tutorials";
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."turtlebot4_cpp_tutorials";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ irobot-create-msgs rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-msgs rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_cpp_tutorials" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_cpp_tutorials-source";
        url = "https://github.com/ros2-gbp/turtlebot4_tutorials-release.git";
        rev = "e62c275f51a351f2e3b4a8a2722490dc13765805";
        hash = "sha256-Q+4zteIz7BFWaYhq6n/KHwjisNVp3dBej6K9/A9SfiU=";
      };
    };
  });
  meta = {
    description = "TurtleBot 4 C++ Tutorials";
  };
})
