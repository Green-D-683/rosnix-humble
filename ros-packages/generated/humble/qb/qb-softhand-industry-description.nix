{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "qb_softhand_industry_description";
  version = "2.1.2-4";
  src = finalAttrs.passthru.sources."qb_softhand_industry_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "qb_softhand_industry_description" = substituteSource {
      src = fetchgit {
        name = "qb_softhand_industry_description-source";
        url = "https://bitbucket.org/qbrobotics/qbshin-ros2-release.git";
        rev = "6a474565d6f7dc0a25ebf7ec57dc70d9ef7a255a";
        hash = "sha256-LXdqYohauCVZHV2ZZDyPIBUIIZNzTxy8MgoQDtV1om0=";
      };
    };
  });
  meta = {
    description = "\n    This package contains the ROS description for qbrobotics® SoftHand INdustry device.\n  ";
  };
})
