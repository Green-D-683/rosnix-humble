{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qb-softhand-industry-msgs,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-srvs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qb_softhand_industry_srvs";
  version = "2.1.2-4";
  src = finalAttrs.passthru.sources."qb_softhand_industry_srvs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ qb-softhand-industry-msgs rosidl-default-runtime std-srvs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ qb-softhand-industry-msgs rosidl-default-runtime std-srvs ];
  passthru.sources = mkSourceSet (sources: {
    "qb_softhand_industry_srvs" = substituteSource {
      src = fetchgit {
        name = "qb_softhand_industry_srvs-source";
        url = "https://bitbucket.org/qbrobotics/qbshin-ros2-release.git";
        rev = "7998686966ad5604282722ec41a3fa1afc5c341b";
        hash = "sha256-7X5ydCWmexGPkAeLms6c0mw841kkYBgdKDUTGNVI2TU=";
      };
    };
  });
  meta = {
    description = "\n    This package contains the ROS services for qbrobotics® SoftHand Industry.\n  ";
  };
})
