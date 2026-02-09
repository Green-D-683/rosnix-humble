{
  ament-cmake,
  buildAmentCmakePackage,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  kuka-driver-interfaces,
  kuka-drivers-core,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fri_state_broadcaster";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."fri_state_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface kuka-driver-interfaces kuka-drivers-core pluginlib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface kuka-driver-interfaces kuka-drivers-core pluginlib ];
  passthru.sources = mkSourceSet (sources: {
    "fri_state_broadcaster" = substituteSource {
      src = fetchgit {
        name = "fri_state_broadcaster-source";
        url = "https://github.com/ros2-gbp/kuka_drivers-release.git";
        rev = "337a62c53423c942489d51e69e584053dca4559c";
        hash = "sha256-4RBiD2YjxzUkFUzdz6WsPHrF4XLSnntT0zTe5OibkdU=";
      };
    };
  });
  meta = {
    description = "Broadcaster for FRI state";
  };
})
