{
  ament-cmake,
  ament-cmake-black,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-index-python,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-proc,
  launch,
  launch-ros,
  leo-description,
  leo-filters,
  leo-fw,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rosapi,
  rosbridge-server,
  sensor-msgs,
  substituteSource,
  web-video-server,
  xacro,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_bringup";
  version = "1.6.0-1";
  src = finalAttrs.passthru.sources."leo_bringup";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python geometry-msgs image-proc launch launch-ros leo-description leo-filters leo-fw robot-state-publisher rosapi rosbridge-server sensor-msgs web-video-server xacro ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python geometry-msgs image-proc launch launch-ros leo-description leo-filters leo-fw robot-state-publisher rosapi rosbridge-server sensor-msgs web-video-server xacro ];
  checkInputs = [ ament-cmake-black ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_bringup" = substituteSource {
      src = fetchgit {
        name = "leo_bringup-source";
        url = "https://github.com/ros2-gbp/leo_robot-release.git";
        rev = "1b639bb12f8a816c3d11206e861036350410752f";
        hash = "sha256-SFipuY+cOgu9jKwQggdyy310RRuJjuiCB14lUW8dkY0=";
      };
    };
  });
  meta = {
    description = "\n    Scripts and launch files for starting basic Leo Rover functionalities. \n  ";
  };
})
