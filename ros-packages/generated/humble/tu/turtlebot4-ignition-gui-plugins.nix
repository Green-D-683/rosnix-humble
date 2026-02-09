{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_ignition_gui_plugins";
  version = "1.0.3-1";
  src = finalAttrs.passthru.sources."turtlebot4_ignition_gui_plugins";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "ignition-gui6" ]; };
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "qml-module-qtquick-extras" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "ignition-gui6" ]; };
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "qml-module-qtquick-extras" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_ignition_gui_plugins" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_ignition_gui_plugins-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "8e601f2d0b7985330ac78f7bf5ee9d799c35f044";
        hash = "sha256-pe4RYhfzwm6R+SBwXVu43bF/YBdWuvNbPQ0ea7W/Erc=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Ignition Simulator GUI Plugins";
  };
})
