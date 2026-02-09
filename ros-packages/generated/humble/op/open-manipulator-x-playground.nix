{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  moveit-ros-planning-interface,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator_x_playground";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."open_manipulator_x_playground";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ moveit-ros-planning-interface rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ moveit-ros-planning-interface rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator_x_playground" = substituteSource {
      src = fetchgit {
        name = "open_manipulator_x_playground-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "51bbab0b90b5dd1e5a5ce687d3f9d1e33d73ae4f";
        hash = "sha256-5rU1CfOlIv8EEMl2VfEJVewsjDwKCd7klm4zEveGKck=";
      };
    };
  });
  meta = {
    description = "\n    This package provides an example for utilizing the MoveIt API with the OpenMANIPULATOR-X,\n    allowing users to practice and experiment freely.\n  ";
  };
})
