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
  pname = "as2_cli";
  version = "1.1.3-1";
  src = finalAttrs.passthru.sources."as2_cli";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "as2_cli" = substituteSource {
      src = fetchgit {
        name = "as2_cli-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "5db9e12084a375462f65fd0c5a5645f69d0bc1cb";
        hash = "sha256-5imqul4a7remqjeoYxJ1Uhy86WI+JVmz+xZ9yTBkAxI=";
      };
    };
  });
  meta = {
    description = "AS2 CLI Package";
  };
})
