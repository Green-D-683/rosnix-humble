{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tiago-pro-head-bringup,
  tiago-pro-head-controller-configuration,
  tiago-pro-head-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_head_robot";
  version = "1.7.0-1";
  src = finalAttrs.passthru.sources."tiago_pro_head_robot";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ tiago-pro-head-bringup tiago-pro-head-controller-configuration tiago-pro-head-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tiago-pro-head-bringup tiago-pro-head-controller-configuration tiago-pro-head-description ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_head_robot" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_head_robot-source";
        url = "https://github.com/ros2-gbp/tiago_pro_head_robot-release.git";
        rev = "b2ff2dc43e46a68ae829df2cb749098b0c22f5da";
        hash = "sha256-DC0k/0jOMPMTZryzU9xVg6Pujs4YtB8xh6mX+vOMfBY=";
      };
    };
  });
  meta = {
    description = "The tiago_pro_head_robot package";
  };
})
