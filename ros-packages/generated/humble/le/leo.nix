{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo-description,
  leo-msgs,
  leo-teleop,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo";
  version = "1.3.0-1";
  src = finalAttrs.passthru.sources."leo";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ leo-description leo-msgs leo-teleop ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ leo-description leo-msgs leo-teleop ];
  passthru.sources = mkSourceSet (sources: {
    "leo" = substituteSource {
      src = fetchgit {
        name = "leo-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "e23359eec108d4c4ef7110fa2ccc1a2748ec22c3";
        hash = "sha256-PHvttYvRb51wt05yIBnnpEkd5iG3G2ryU0VXJNfXDjg=";
      };
    };
  });
  meta = {
    description = "\n    Metapackage of software for Leo Rover common to the robot and ROS desktop\n  ";
  };
})
