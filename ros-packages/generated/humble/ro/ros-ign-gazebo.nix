{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-gz-sim,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros_ign_gazebo";
  version = "0.244.21-1";
  src = finalAttrs.passthru.sources."ros_ign_gazebo";
  nativeBuildInputs = [ ament-cmake ament-index-cpp ];
  propagatedNativeBuildInputs = [ ros-gz-sim ];
  buildInputs = [ ament-cmake ament-index-cpp ];
  propagatedBuildInputs = [ ros-gz-sim ];
  passthru.sources = mkSourceSet (sources: {
    "ros_ign_gazebo" = substituteSource {
      src = fetchgit {
        name = "ros_ign_gazebo-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "c950a7a804d87ccfc25778273fda99be57cae78a";
        hash = "sha256-CDbu9bwqRmYnzvfRMdjAEhpZ28IfA2wS+fzv0K5en0A=";
      };
    };
  });
  meta = {
    description = "Shim package to redirect to ros_gz_sim.";
  };
})
