{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tinyxml2-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "kuka_external_control_sdk";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."kuka_external_control_sdk";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ ament-cmake tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libgrpc" "libssl-dev" "pkg-config" "protobuf-compiler-grpc" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ ament-cmake tinyxml2-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgrpc" "libssl-dev" "pkg-config" "protobuf-compiler-grpc" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "kuka_external_control_sdk" = substituteSource {
      src = fetchgit {
        name = "kuka_external_control_sdk-source";
        url = "https://github.com/ros2-gbp/kuka_external_control_sdk-release.git";
        rev = "835b93b268a457094afbec44f8f698beea3e05ef";
        hash = "sha256-Q14K5PV0WFSp0omc+hT9tm2QoDg1vmNAdwclxf6iwNg=";
      };
    };
  });
  meta = {
    description = "Client libraries for external control interfaces of KUKA";
  };
})
