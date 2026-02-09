{
  agnocast-ioctl-wrapper,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2agnocast";
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."ros2agnocast";
  propagatedNativeBuildInputs = [ agnocast-ioctl-wrapper ];
  propagatedBuildInputs = [ agnocast-ioctl-wrapper ];
  passthru.sources = mkSourceSet (sources: {
    "ros2agnocast" = substituteSource {
      src = fetchgit {
        name = "ros2agnocast-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "aae6648c3b6b93721034759399e1a60be97d27d5";
        hash = "sha256-ULR/rWRC6dD4BaegCNxC4xV87KOBB/eo690DHbtwgb8=";
      };
    };
  });
  meta = {
    description = "\n    The ROS 2 command line tool extension for Agnocast.\n  ";
  };
})
