{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  open-manipulator-x-bringup,
  open-manipulator-x-description,
  open-manipulator-x-gui,
  open-manipulator-x-moveit-config,
  open-manipulator-x-playground,
  open-manipulator-x-teleop,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "open_manipulator";
  version = "3.0.4-1";
  src = finalAttrs.passthru.sources."open_manipulator";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ open-manipulator-x-bringup open-manipulator-x-description open-manipulator-x-gui open-manipulator-x-moveit-config open-manipulator-x-playground open-manipulator-x-teleop ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ open-manipulator-x-bringup open-manipulator-x-description open-manipulator-x-gui open-manipulator-x-moveit-config open-manipulator-x-playground open-manipulator-x-teleop ];
  passthru.sources = mkSourceSet (sources: {
    "open_manipulator" = substituteSource {
      src = fetchgit {
        name = "open_manipulator-source";
        url = "https://github.com/ros2-gbp/open_manipulator-release.git";
        rev = "821902234f8976ba82ac8993e520e4b8c0860b91";
        hash = "sha256-PMjtshx6oF7X3KyNQOvL3FaKIwu+uTcG9XvqSsF3Lqs=";
      };
    };
  });
  meta = {
    description = "\n    OpenMANIPULATOR-X meta ROS 2 package.\n  ";
  };
})
