{
  ament-cmake-auto,
  ament-lint-auto,
  autoware-cmake,
  autoware-downsample-filters,
  autoware-ekf-localizer,
  autoware-lint-common,
  autoware-ndt-scan-matcher,
  autoware-pose-initializer,
  autoware-stop-filter,
  autoware-twist2accel,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "autoware_core_localization";
  version = "1.4.0-1";
  src = finalAttrs.passthru.sources."autoware_core_localization";
  nativeBuildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedNativeBuildInputs = [ autoware-downsample-filters autoware-ekf-localizer autoware-ndt-scan-matcher autoware-pose-initializer autoware-stop-filter autoware-twist2accel ];
  buildInputs = [ ament-cmake-auto autoware-cmake ];
  propagatedBuildInputs = [ autoware-downsample-filters autoware-ekf-localizer autoware-ndt-scan-matcher autoware-pose-initializer autoware-stop-filter autoware-twist2accel ];
  checkInputs = [ ament-lint-auto autoware-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "autoware_core_localization" = substituteSource {
      src = fetchgit {
        name = "autoware_core_localization-source";
        url = "https://github.com/ros2-gbp/autoware_core-release.git";
        rev = "b91f89ceb5764f32721d236e44b46cf31393f036";
        hash = "sha256-YA5wnrsZ7Lr5jJug8KfuPpBJIeGnZJNICU765ismBzs=";
      };
    };
  });
  meta = {
    description = "The autoware_core_localization package";
  };
})
