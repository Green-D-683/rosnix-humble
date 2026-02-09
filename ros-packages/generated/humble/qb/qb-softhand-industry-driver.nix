{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qb-softhand-industry-srvs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qb_softhand_industry_driver";
  version = "2.1.2-4";
  src = finalAttrs.passthru.sources."qb_softhand_industry_driver";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ qb-softhand-industry-srvs rclcpp ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ qb-softhand-industry-srvs rclcpp ];
  passthru.sources = mkSourceSet (sources: {
    "qb_softhand_industry_driver" = substituteSource {
      src = fetchgit {
        name = "qb_softhand_industry_driver-source";
        url = "https://bitbucket.org/qbrobotics/qbshin-ros2-release.git";
        rev = "bc238cb0bc2732b3a3b7e1582a53d218379b848c";
        hash = "sha256-CLqBrRYFS36sEMXIJBJzs+pTjv9AUKNxzgDUtcSZoUg=";
      };
    };
  });
  meta = {
    description = "\n    This package contains communication interface for qbrobotics® SoftHand Industry.\n  ";
  };
})
