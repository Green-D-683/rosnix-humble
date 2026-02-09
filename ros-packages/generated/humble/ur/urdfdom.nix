{
  buildCmakePackage,
  console-bridge-vendor,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tinyxml-vendor,
  urdfdom-headers,
}:
buildCmakePackage (finalAttrs: {
  pname = "urdfdom";
  version = "3.0.2-2";
  src = finalAttrs.passthru.sources."urdfdom";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ console-bridge-vendor tinyxml-vendor urdfdom-headers ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libconsole-bridge-dev" "tinyxml" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ console-bridge-vendor tinyxml-vendor urdfdom-headers ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libconsole-bridge-dev" "tinyxml" ]; };
  passthru.sources = mkSourceSet (sources: {
    "urdfdom" = substituteSource {
      src = fetchgit {
        name = "urdfdom-source";
        url = "https://github.com/ros2-gbp/urdfdom-release.git";
        rev = "f542c91673cb3fa3c8742164d1565a09de150c30";
        hash = "sha256-mxUV23F0tO2GutjNSB1FCaDqCRshrntM+uBBiqUZweg=";
      };
    };
  });
  meta = {
    description = "A library to access URDFs using the DOM model.";
  };
})
