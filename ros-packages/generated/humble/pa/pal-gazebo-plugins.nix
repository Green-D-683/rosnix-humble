{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  control-toolbox,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-dev,
  gazebo-msgs,
  gazebo-ros,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_gazebo_plugins";
  version = "4.1.1-1";
  src = finalAttrs.passthru.sources."pal_gazebo_plugins";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ control-toolbox gazebo-dev gazebo-msgs gazebo-ros nav-msgs rclcpp std-msgs tf2-geometry-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ control-toolbox gazebo-dev gazebo-msgs gazebo-ros nav-msgs rclcpp std-msgs tf2-geometry-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_gazebo_plugins" = substituteSource {
      src = fetchgit {
        name = "pal_gazebo_plugins-source";
        url = "https://github.com/pal-gbp/pal_gazebo_plugins-release.git";
        rev = "13bc7ee5cf1a20b1b0aab456acb0bfc4dd85c84f";
        hash = "sha256-sXMfbEIlcWJdum6C7ajR/AW2E7pJY5fxuHTXSoRGQGw=";
      };
    };
  });
  meta = {
    description = "\n    Robot-independent Gazebo plugins used by PAL Robotics.\n  ";
  };
})
