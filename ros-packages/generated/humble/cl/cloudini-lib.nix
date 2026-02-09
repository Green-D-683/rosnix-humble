{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap-vendor,
  mkSourceSet,
  pcl-ros,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cloudini_lib";
  version = "0.11.1-2";
  src = finalAttrs.passthru.sources."cloudini_lib";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ mcap-vendor pcl-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libzstd-dev" "lz4" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ mcap-vendor pcl-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libzstd-dev" "lz4" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "cloudini_lib" = substituteSource {
      src = fetchgit {
        name = "cloudini_lib-source";
        url = "https://github.com/facontidavide/cloudini-release.git";
        rev = "5b1bf14b28876099a5bef4f76832f53f019118c1";
        hash = "sha256-fwfcYznwjz67vpsiW82eM3HOgCvuZeZVNPai1RS9u0g=";
      };
    };
  });
  meta = {
    description = "\n  Main library of Cloudini, the pointcloud compression library\n  ";
  };
})
