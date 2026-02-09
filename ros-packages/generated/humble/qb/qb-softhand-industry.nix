{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  qb-softhand-industry-description,
  qb-softhand-industry-driver,
  qb-softhand-industry-ros2-control,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qb_softhand_industry";
  version = "2.1.2-4";
  src = finalAttrs.passthru.sources."qb_softhand_industry";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ qb-softhand-industry-description qb-softhand-industry-driver qb-softhand-industry-ros2-control ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ qb-softhand-industry-description qb-softhand-industry-driver qb-softhand-industry-ros2-control ];
  passthru.sources = mkSourceSet (sources: {
    "qb_softhand_industry" = substituteSource {
      src = fetchgit {
        name = "qb_softhand_industry-source";
        url = "https://bitbucket.org/qbrobotics/qbshin-ros2-release.git";
        rev = "7f70e9316d899a3c01a15f48147697ed73bdd8e7";
        hash = "sha256-GMI9hhacVE8JBRv5wVlilviZgb1xQJjjAAvNg2dQUqw=";
      };
    };
  });
  meta = {
    description = "\n    This package contains the ROS interface for qbrobotics® SoftHand INdustry device.\n  ";
  };
})
