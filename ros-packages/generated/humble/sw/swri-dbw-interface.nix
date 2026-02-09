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
  pname = "swri_dbw_interface";
  version = "3.8.7-1";
  src = finalAttrs.passthru.sources."swri_dbw_interface";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "swri_dbw_interface" = substituteSource {
      src = fetchgit {
        name = "swri_dbw_interface-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "9d3524d7679200c7120fc179f888c5f2758fa4a7";
        hash = "sha256-lxsURBYM5Sv/2418gnkvGzvpmrRCWlremzqT1LXglWY=";
      };
    };
  });
  meta = {
    description = "\n    This package provides documentation on common interface conventions for\n    drive-by-wire systems.\n  ";
  };
})
