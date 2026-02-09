{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  crane-plus-control,
  crane-plus-description,
  crane-plus-moveit-config,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-geometry,
  mkSourceSet,
  moveit-ros-planning-interface,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
  usb-cam,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "crane_plus_examples";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."crane_plus_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ crane-plus-control crane-plus-description crane-plus-moveit-config cv-bridge geometry-msgs image-geometry moveit-ros-planning-interface rclcpp tf2-geometry-msgs usb-cam ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ crane-plus-control crane-plus-description crane-plus-moveit-config cv-bridge geometry-msgs image-geometry moveit-ros-planning-interface rclcpp tf2-geometry-msgs usb-cam ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "crane_plus_examples" = substituteSource {
      src = fetchgit {
        name = "crane_plus_examples-source";
        url = "https://github.com/ros2-gbp/crane_plus-release.git";
        rev = "48a0fbcbb12a3db610c7dc1179adfc296a5b23b8";
        hash = "sha256-ZYQprt6t7q4XDQ+BeBX2VL36hprZ9Vhqz9UAPRQ8L+E=";
      };
    };
  });
  meta = {
    description = "CRANE+ V2 examples package";
  };
})
