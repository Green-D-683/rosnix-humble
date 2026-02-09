{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-base,
  ros-ign-bridge,
  ros-ign-gazebo,
  ros-ign-image,
  ros-ign-interfaces,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "simulation";
  version = "0.10.0-1";
  src = finalAttrs.passthru.sources."simulation";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-base ros-ign-bridge ros-ign-gazebo ros-ign-image ros-ign-interfaces ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-base ros-ign-bridge ros-ign-gazebo ros-ign-image ros-ign-interfaces ];
  passthru.sources = mkSourceSet (sources: {
    "simulation" = substituteSource {
      src = fetchgit {
        name = "simulation-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "344e6c8287249596d9e6013cf3e8371b0c254d2c";
        hash = "sha256-bvicFtHnIqmwZPfpdtNprdkWQWqSKGs+cezebLL0sUs=";
      };
    };
  });
  meta = {
    description = "A package which extends 'ros_base' and includes simulation packages.";
  };
})
