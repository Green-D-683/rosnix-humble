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
  pname = "ewellix_description";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."ewellix_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ewellix_description" = substituteSource {
      src = fetchgit {
        name = "ewellix_description-source";
        url = "https://github.com/clearpath-gbp/ewellix_lift_common-release.git";
        rev = "91d239c4587c1bcd2aea434512a7be498450947b";
        hash = "sha256-YV+Y6+0ysG9HDKviPcelAGNgQe/aD5XRot/qTI5kAmQ=";
      };
    };
  });
  meta = {
    description = "Clearpath's description package for Ewellix TLT lifting columns";
  };
})
