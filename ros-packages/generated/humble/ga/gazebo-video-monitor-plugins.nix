{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-dev,
  gazebo-ros,
  gazebo-video-monitor-interfaces,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  std-srvs,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_video_monitor_plugins";
  version = "0.8.1-1";
  src = finalAttrs.passthru.sources."gazebo_video_monitor_plugins";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gazebo-dev gazebo-ros gazebo-video-monitor-interfaces rclcpp std-srvs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-dev gazebo-ros gazebo-video-monitor-interfaces rclcpp std-srvs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gazebo_video_monitor_plugins" = substituteSource {
      src = fetchgit {
        name = "gazebo_video_monitor_plugins-source";
        url = "https://github.com/ros2-gbp/gazebo_video_monitors-release.git";
        rev = "f7c246c80e3917e4def873beab42514af1697a46";
        hash = "sha256-KEzqnS0nZ9GatgieuIlhG9OC9WOEN5xNCys7JtkZzsk=";
      };
    };
  });
  meta = {
    description = "\n    gazebo_video_monitor_plugins is a package that lets the user record videos of a ";
  };
})
