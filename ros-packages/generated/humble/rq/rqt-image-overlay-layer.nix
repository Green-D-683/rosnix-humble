{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  message-filters,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rcpputils,
  rosSystemPackages,
  rosidl-runtime-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rqt_image_overlay_layer";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."rqt_image_overlay_layer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ message-filters pluginlib rclcpp rcpputils rosidl-runtime-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ message-filters pluginlib rclcpp rcpputils rosidl-runtime-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rqt_image_overlay_layer" = substituteSource {
      src = fetchgit {
        name = "rqt_image_overlay_layer-source";
        url = "https://github.com/ros2-gbp/rqt_image_overlay-release.git";
        rev = "bf3df52eb546b45d2de5a96a0839ab413df5065a";
        hash = "sha256-qBXKAQurQgQhoyzn8PRbIOjiZJ2TiEYEaqPtQO+o7H8=";
      };
    };
  });
  meta = {
    description = "Provides an rqt_image_overlay_layer plugin interface, and a template impelementation class";
  };
})
