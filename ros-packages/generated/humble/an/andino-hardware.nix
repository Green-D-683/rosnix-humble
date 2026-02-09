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
  pname = "andino_hardware";
  version = "0.2.0-1";
  src = finalAttrs.passthru.sources."andino_hardware";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "andino_hardware" = substituteSource {
      src = fetchgit {
        name = "andino_hardware-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "8d8238fa7fbbf6d714cb7acf1cf06195894defb6";
        hash = "sha256-nvqOaKrN8lHMyucg7nPofK4yobIO8NO44II+mtW5/9s=";
      };
    };
  });
  meta = {
    description = "The andino_hardware package";
  };
})
