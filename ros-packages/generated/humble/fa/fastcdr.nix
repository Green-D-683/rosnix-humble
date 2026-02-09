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
  pname = "fastcdr";
  version = "1.0.29-1";
  src = finalAttrs.passthru.sources."fastcdr";
  nativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "cmake" ]; };
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "cmake" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fastcdr" = substituteSource {
      src = fetchgit {
        name = "fastcdr-source";
        url = "https://github.com/ros2-gbp/fastcdr-release.git";
        rev = "69edde74b48eeb95f8a20501a1f34258099b43e8";
        hash = "sha256-I9xbulrergoElisR6foyaxVWSpnN/tO4vvIcY4hKdx0=";
      };
    };
  });
  meta = {
    description = "CDR serialization implementation.";
  };
})
