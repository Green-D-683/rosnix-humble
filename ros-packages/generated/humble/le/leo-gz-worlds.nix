{
  ament-cmake,
  ament-cmake-copyright,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "leo_gz_worlds";
  version = "1.1.2-1";
  src = finalAttrs.passthru.sources."leo_gz_worlds";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-copyright ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "leo_gz_worlds" = substituteSource {
      src = fetchgit {
        name = "leo_gz_worlds-source";
        url = "https://github.com/ros2-gbp/leo_simulator-release.git";
        rev = "fe7a28857d1d3e7f6e457b9daa20dbc02c9c727e";
        hash = "sha256-TPG/eYd4vUcVeC99dhGqcioTXgs+vDUUuEYwNqALPnc=";
      };
    };
  });
  meta = {
    description = "Gazebo worlds for Leo Rover simulation in ROS 2";
  };
})
