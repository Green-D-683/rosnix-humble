{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_hey5_controller_configuration";
  version = "4.2.0-1";
  src = finalAttrs.passthru.sources."pal_hey5_controller_configuration";
  nativeBuildInputs = [ ament-cmake-auto ];
  buildInputs = [ ament-cmake-auto ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_hey5_controller_configuration" = substituteSource {
      src = fetchgit {
        name = "pal_hey5_controller_configuration-source";
        url = "https://github.com/pal-gbp/pal_hey5-release.git";
        rev = "43ae6e0ac173b6da525a43b8514c47ab6a59b810";
        hash = "sha256-fgHnCl5kaoikyVKnQJHVlA5CeFprfN2LhXKiZZKDmgQ=";
      };
    };
  });
  meta = {
    description = "The pal_hey5_controller_configuration package";
  };
})
