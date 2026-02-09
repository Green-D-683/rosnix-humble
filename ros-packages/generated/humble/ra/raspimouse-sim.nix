{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  raspimouse-fake,
  raspimouse-gazebo,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "raspimouse_sim";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."raspimouse_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ raspimouse-fake raspimouse-gazebo ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ raspimouse-fake raspimouse-gazebo ];
  passthru.sources = mkSourceSet (sources: {
    "raspimouse_sim" = substituteSource {
      src = fetchgit {
        name = "raspimouse_sim-source";
        url = "https://github.com/ros2-gbp/raspimouse_sim-release.git";
        rev = "2b980147322d5e53b802b910086269c7da11ff6b";
        hash = "sha256-hK0nZbUe46oIIljVmBoapgmABRQJN+KIr6FQdusBy1E=";
      };
    };
  });
  meta = {
    description = "ROS 2 package suite for Raspberry Pi Mouse Simulator";
  };
})
