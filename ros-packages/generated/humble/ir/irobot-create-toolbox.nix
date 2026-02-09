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
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "irobot_create_toolbox";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."irobot_create_toolbox";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-math6" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ignition-math6" ]; };
  checkInputs = [ ament-cmake-cppcheck ament-cmake-cpplint ament-cmake-flake8 ament-cmake-lint-cmake ament-cmake-pep257 ament-cmake-uncrustify ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "irobot_create_toolbox" = substituteSource {
      src = fetchgit {
        name = "irobot_create_toolbox-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "0d9cbf3c3eb2bee3283f48fdeff9cf6537fdaa18";
        hash = "sha256-8nJ52vZWOgz0zQASJ+NkDp2Xy4C24uJYself8punurI=";
      };
    };
  });
  meta = {
    description = "Components and helpers for the iRobot(R) Create(R) 3 Educational Robot.";
  };
})
