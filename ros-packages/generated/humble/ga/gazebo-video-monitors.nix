{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo-video-monitor-interfaces,
  gazebo-video-monitor-plugins,
  gazebo-video-monitor-utils,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gazebo_video_monitors";
  version = "0.8.1-1";
  src = finalAttrs.passthru.sources."gazebo_video_monitors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gazebo-video-monitor-interfaces gazebo-video-monitor-plugins gazebo-video-monitor-utils ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gazebo-video-monitor-interfaces gazebo-video-monitor-plugins gazebo-video-monitor-utils ];
  passthru.sources = mkSourceSet (sources: {
    "gazebo_video_monitors" = substituteSource {
      src = fetchgit {
        name = "gazebo_video_monitors-source";
        url = "https://github.com/ros2-gbp/gazebo_video_monitors-release.git";
        rev = "e14ac23a85910ece7e25ba527b4a7e6bdfd79e24";
        hash = "sha256-MouczI+rHNvxvkkP86XJK8CFh21DekZYPpUqUSj5eJ0=";
      };
    };
  });
  meta = {
    description = "\n    Metapackage that groups together the gazebo_video_monitors packages.\n  ";
  };
})
