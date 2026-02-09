{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-srvs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "gazebo_video_monitor_utils";
  version = "0.8.1-1";
  src = finalAttrs.passthru.sources."gazebo_video_monitor_utils";
  propagatedNativeBuildInputs = [ gazebo-msgs rclpy std-srvs ];
  propagatedBuildInputs = [ gazebo-msgs rclpy std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_video_monitor_utils" = substituteSource {
      src = fetchgit {
        name = "gazebo_video_monitor_utils-source";
        url = "https://github.com/ros2-gbp/gazebo_video_monitors-release.git";
        rev = "f49c6659093fa96e833c19c224461836e3017026";
        hash = "sha256-vEJNNeclh5xygZUb79ndkgcSo49xEDCEILVbPF0EioI=";
      };
    };
  });
  meta = {
    description = "\n    Contains utility scripts that are meant to interact with the gazebo video monitor plugins.\n  ";
  };
})
