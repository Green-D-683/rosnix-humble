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
  gazebo-plugins,
  gazebo-ros,
  gazebo-ros2-control,
  irobot-create-common-bringup,
  irobot-create-description,
  irobot-create-gazebo-plugins,
  mkSourceSet,
  ros2launch,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_gazebo_bringup";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."irobot_create_gazebo_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control irobot-create-common-bringup irobot-create-description irobot-create-gazebo-plugins ros2launch ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-plugins gazebo-ros gazebo-ros2-control irobot-create-common-bringup irobot-create-description irobot-create-gazebo-plugins ros2launch ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_gazebo_bringup" = substituteSource {
      src = fetchgit {
        name = "irobot_create_gazebo_bringup-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "259863f06f25276e6ca057d2ee6fda336315e71c";
        hash = "sha256-hq3lkMLK+P/LsqHDswL/HviVpPKwi0/zeQf1zIg2yKE=";
      };
    };
  });
  meta = {
    description = "Provides launch and configuration scripts for a Gazebo simulated iRobot(R) Create(R) 3 Educational Robot.";
  };
})
