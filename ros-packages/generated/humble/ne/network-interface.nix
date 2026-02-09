{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "network_interface";
  version = "2003.1.1-2";
  src = finalAttrs.passthru.sources."network_interface";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ std-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "network_interface" = substituteSource {
      src = fetchgit {
        name = "network_interface-source";
        url = "https://github.com/astuff/network_interface-release.git";
        rev = "4de617ce2a7a38da49620a34fb842022196c862f";
        hash = "sha256-bdi7PiMuO5ObykGE6q/vZ9I8wGKMmCytNkETU3hcC40=";
      };
    };
  });
  meta = {
    description = "Network interfaces and messages.";
  };
})
