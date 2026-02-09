{
  ament-cmake,
  buildAmentCmakePackage,
  ewellix-interfaces,
  ewellix-moveit-config,
  fetchgit,
  fetchurl,
  fetchzip,
  ign-ros2-control,
  mkSourceSet,
  ros-gz,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ewellix_sim";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."ewellix_sim";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ewellix-interfaces ewellix-moveit-config ign-ros2-control ros-gz rviz2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ewellix-interfaces ewellix-moveit-config ign-ros2-control ros-gz rviz2 ];
  passthru.sources = mkSourceSet (sources: {
    "ewellix_sim" = substituteSource {
      src = fetchgit {
        name = "ewellix_sim-source";
        url = "https://github.com/clearpath-gbp/ewellix_lift_common-release.git";
        rev = "1a19171496aaf1822a2e6eda6b5f5052f59ad933";
        hash = "sha256-1R/rrBb1fb8LcNdTxxjUdJsRbo1VParZ7AZ5xKYJR8E=";
      };
    };
  });
  meta = {
    description = "Clearpath's simulation package for Ewellix TLT lifting columns";
  };
})
