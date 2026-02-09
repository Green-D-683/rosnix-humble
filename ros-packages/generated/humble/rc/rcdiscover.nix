{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "rcdiscover";
  version = "1.1.6-1";
  src = finalAttrs.passthru.sources."rcdiscover";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rcdiscover" = substituteSource {
      src = fetchgit {
        name = "rcdiscover-source";
        url = "https://github.com/ros2-gbp/rcdiscover-release.git";
        rev = "040a6f86e0390bd6c362136d4868c3b1a4c5532f";
        hash = "sha256-73zdM/PrKUp1+z2vYAMcS/HmKLsquerS/2z/1IVNlao=";
      };
    };
  });
  meta = {
    description = "\n        This package contains tools for the discovery of Roboception devices via GigE Vision.\n    ";
  };
})
