{
  buildCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libnabo,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildCmakePackage (finalAttrs: {
  pname = "libpointmatcher";
  version = "1.3.1-3";
  src = finalAttrs.passthru.sources."libpointmatcher";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  propagatedNativeBuildInputs = [ libnabo ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  propagatedBuildInputs = [ libnabo ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  passthru.sources = mkSourceSet (sources: {
    "libpointmatcher" = substituteSource {
      src = fetchgit {
        name = "libpointmatcher-source";
        url = "https://github.com/ros2-gbp/libpointmatcher-release.git";
        rev = "0ed5b47746e28c0e56fde1b7aa17bdc0200bd58c";
        hash = "sha256-80SUcbIPClDWJx8kZMLEk7AsJ63OH30H+6d4EFLUnp4=";
      };
    };
  });
  meta = {
    description = "\n		libpointmatcher is a modular ICP library, useful for robotics and computer vision.\n	";
  };
})
