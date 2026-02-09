{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  hls-lfcd-lds-driver,
  joy-linux,
  mkSourceSet,
  nav2-map-server,
  raspimouse,
  raspimouse-msgs,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  rt-usb-9axisimu-driver,
  sensor-msgs,
  slam-toolbox,
  std-msgs,
  std-srvs,
  substituteSource,
  usb-cam,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_ros2_examples";
  version = "2.2.1-2";
  src = finalAttrs.passthru.sources."raspimouse_ros2_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs hls-lfcd-lds-driver joy-linux nav2-map-server raspimouse raspimouse-msgs rclcpp rclcpp-components rclcpp-lifecycle rt-usb-9axisimu-driver sensor-msgs slam-toolbox std-msgs std-srvs usb-cam ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" "v4l-utils" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs hls-lfcd-lds-driver joy-linux nav2-map-server raspimouse raspimouse-msgs rclcpp rclcpp-components rclcpp-lifecycle rt-usb-9axisimu-driver sensor-msgs slam-toolbox std-msgs std-srvs usb-cam ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" "v4l-utils" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_ros2_examples" = substituteSource {
      src = fetchgit {
        name = "raspimouse_ros2_examples-source";
        url = "https://github.com/ros2-gbp/raspimouse_ros2_examples-release.git";
        rev = "1281812f5601bbceec61dfba111c9dcfdf3bb0a1";
        hash = "sha256-II+N0ggeR5tWvVq3qD8IDHJMesEJe7wWjD6MvrGhs0E=";
      };
    };
  });
  meta = {
    description = "Raspberry Pi Mouse examples";
  };
})
