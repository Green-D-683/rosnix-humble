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
  pname = "andino_firmware";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."andino_firmware";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "andino_firmware" = substituteSource {
      src = fetchgit {
        name = "andino_firmware-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "f20924ba620caa4cb185a4c86e98267cfc8c92d5";
        hash = "sha256-bhgXIdtaGX2dz0xt+BoRa3aeexU6rCrL0+hzQIb8P7M=";
      };
    };
  });
  meta = {
    description = "The andino_firmware package";
  };
})
