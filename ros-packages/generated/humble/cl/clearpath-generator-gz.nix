{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  clearpath-config,
  clearpath-generator-common,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "clearpath_generator_gz";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."clearpath_generator_gz";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ clearpath-config clearpath-generator-common ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ clearpath-config clearpath-generator-common ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "clearpath_generator_gz" = substituteSource {
      src = fetchgit {
        name = "clearpath_generator_gz-source";
        url = "https://github.com/clearpath-gbp/clearpath_simulator-release.git";
        rev = "5f87cec9992379f7e80ba9f7a17f7d9507a0af62";
        hash = "sha256-KZo96l78oUr9hJDekXw5+YIuY4kU3H/RUnc0pxjC9WU=";
      };
    };
  });
  meta = {
    description = "Clearpath Gazebo Generator";
  };
})
