{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-ros,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_no_physics_plugin";
  version = "0.1.1-2";
  src = finalAttrs.passthru.sources."gazebo_no_physics_plugin";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gazebo-ros rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-ros rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_no_physics_plugin" = substituteSource {
      src = fetchgit {
        name = "gazebo_no_physics_plugin-source";
        url = "https://github.com/ros2-gbp/gazebo_no_physics_plugin-release.git";
        rev = "c25ba6596689ae642412614a9aeb00dd0102e042";
        hash = "sha256-Vjp7RR3jEbWGoMF4WTMHwle8VgMnkm65KpWvaDGWqNY=";
      };
    };
  });
  meta = {
    description = "Disables physics in gazebo";
  };
})
