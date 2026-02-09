{
  buildAmentPythonPackage,
  controller-manager,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  laser-filters,
  mkSourceSet,
  robot-localization,
  robot-state-publisher,
  rosSystemPackages,
  substituteSource,
  webots-ros2-control,
  webots-ros2-driver,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_husarion";
  version = "2025.0.0-2";
  src = finalAttrs.passthru.sources."webots_ros2_husarion";
  propagatedNativeBuildInputs = [ controller-manager diff-drive-controller joint-state-broadcaster laser-filters robot-localization robot-state-publisher webots-ros2-control webots-ros2-driver ];
  propagatedBuildInputs = [ controller-manager diff-drive-controller joint-state-broadcaster laser-filters robot-localization robot-state-publisher webots-ros2-control webots-ros2-driver ];
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_husarion" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_husarion-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "e69c7fd3e761a3c179db29b4513696247e741f9b";
        hash = "sha256-Q2Ab3IH/ed6TaZDVYCA29T7WfDjokoO+j92vUyAjtJk=";
      };
    };
  });
  meta = {
    description = "Husarion ROSbot 2R and XL robots ROS2 interface for Webots.";
  };
})
