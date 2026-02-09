{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_environment";
  version = "3.2.2-1";
  src = finalAttrs.passthru.sources."ros_environment";
  nativeBuildInputs = [ ament-cmake-core ];
  buildInputs = [ ament-cmake-core ];
  passthru.sources = mkSourceSet (sources: {
    "ros_environment" = substituteSource {
      src = fetchgit {
        name = "ros_environment-source";
        url = "https://github.com/ros2-gbp/ros_environment-release.git";
        rev = "4ef83fcfe71d33e27fcdc4d2dbc7fbd692121b15";
        hash = "sha256-XtonGZlyFRb0OxhZIDY7WYOKJsVQrXFb74koRHjhkdg=";
      };
    };
  });
  meta = {
    description = "The package provides the environment variables `ROS_VERSION` and `ROS_DISTRO`.";
  };
})
