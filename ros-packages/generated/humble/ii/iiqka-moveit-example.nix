{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  kuka-iiqka-eac-driver,
  mkSourceSet,
  moveit,
  moveit-ros-planning-interface,
  moveit-visual-tools,
  ros2-controllers-test-nodes,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "iiqka_moveit_example";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."iiqka_moveit_example";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ kuka-iiqka-eac-driver moveit moveit-ros-planning-interface moveit-visual-tools ros2-controllers-test-nodes ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ kuka-iiqka-eac-driver moveit moveit-ros-planning-interface moveit-visual-tools ros2-controllers-test-nodes ];
  passthru.sources = mkSourceSet (sources: {
    "iiqka_moveit_example" = substituteSource {
      src = fetchgit {
        name = "iiqka_moveit_example-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "8e1533cba3aa16f6960af04002a845547426d443";
        hash = "sha256-LTnfOrIzCY9OisGFlmSgWAl6PQsWXc/5GN7N5gg41Os=";
      };
    };
  });
  meta = {
    description = "ROS example package using the iiQKA driver and moveit";
  };
})
