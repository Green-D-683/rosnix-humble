{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-cpplint,
  ament-cmake-flake8,
  ament-cmake-lint-cmake,
  ament-cmake-pep257,
  ament-cmake-uncrustify,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-dev,
  gazebo-ros,
  geometry-msgs,
  irobot-create-msgs,
  irobot-create-toolbox,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_gazebo_plugins";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."irobot_create_gazebo_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gazebo-dev gazebo-ros geometry-msgs irobot-create-msgs irobot-create-toolbox rclcpp sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-dev gazebo-ros geometry-msgs irobot-create-msgs irobot-create-toolbox rclcpp sensor-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_gazebo_plugins" = substituteSource {
      src = fetchgit {
        name = "irobot_create_gazebo_plugins-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "dece935213b3017928a8b52ee4bb5921d15455d2";
        hash = "sha256-09luFoNWxSKOUpwGKNsGCItmDaJfMclnUO0o6FJmJBM=";
      };
    };
  });
  meta = {
    description = "Provides the Gazebo plugins for the iRobot(R) Create(R) 3 Educational Robot.";
  };
})
