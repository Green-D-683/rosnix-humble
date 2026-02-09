{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-core-api,
  autoware-core-control,
  autoware-core-localization,
  autoware-core-map,
  autoware-core-perception,
  autoware-core-planning,
  autoware-core-sensing,
  autoware-core-vehicle,
  autoware-global-parameter-loader,
  autoware-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_core";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_core";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ autoware-core-api autoware-core-control autoware-core-localization autoware-core-map autoware-core-perception autoware-core-planning autoware-core-sensing autoware-core-vehicle autoware-global-parameter-loader rviz2 ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-core-api autoware-core-control autoware-core-localization autoware-core-map autoware-core-perception autoware-core-planning autoware-core-sensing autoware-core-vehicle autoware-global-parameter-loader rviz2 ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core" = substituteSource {
      src = fetchgit {
        name = "autoware_core-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "916dbfe6d817e2f7b0f5495a8c26d8bd715b4d94";
        hash = "sha256-G9b///2Px7fj6bmAaPFhLh91lovyfSLqa0tEjSqN8Wk=";
      };
    };
  });
  meta = {
    description = "The autoware_core package";
  };
})
