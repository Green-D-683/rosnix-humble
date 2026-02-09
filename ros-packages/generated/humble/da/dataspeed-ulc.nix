{
  ament-cmake,
  buildAmentCmakePackage,
  dataspeed-ulc-can,
  dataspeed-ulc-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "dataspeed_ulc";
  version = "2.1.16-1";
  src = finalAttrs.passthru.sources."dataspeed_ulc";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ dataspeed-ulc-can dataspeed-ulc-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dataspeed-ulc-can dataspeed-ulc-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "dataspeed_ulc" = substituteSource {
      src = fetchgit {
        name = "dataspeed_ulc-source";
        url = "https://github.com/DataspeedInc-release/dbw_ros-release.git";
        rev = "fac648190b4e2aeaddb7c53b9a9ca97405cc9b7d";
        hash = "sha256-5Ix/iu70/7zqy4GowfQdYKbKfbTqSQCEgkW2yvA8IFo=";
      };
    };
  });
  meta = {
    description = "\n    CAN interface to the Universal Lat/Lon Controller (ULC) firmware\n  ";
  };
})
