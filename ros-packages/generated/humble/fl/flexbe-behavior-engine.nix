{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe-core,
  flexbe-input,
  flexbe-mirror,
  flexbe-msgs,
  flexbe-onboard,
  flexbe-states,
  flexbe-testing,
  flexbe-widget,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "flexbe_behavior_engine";
  version = "2.3.5-1";
  src = finalAttrs.passthru.sources."flexbe_behavior_engine";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ flexbe-core flexbe-input flexbe-mirror flexbe-msgs flexbe-onboard flexbe-states flexbe-testing flexbe-widget ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ flexbe-core flexbe-input flexbe-mirror flexbe-msgs flexbe-onboard flexbe-states flexbe-testing flexbe-widget ];
  passthru.sources = mkSourceSet (sources: {
    "flexbe_behavior_engine" = substituteSource {
      src = fetchgit {
        name = "flexbe_behavior_engine-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "7742a0846527765a4073d67161c20c3b9ef36006";
        hash = "sha256-ffrz8/ky2t4Z0i4IyqWcQF3ys0TTehafAgv9VXo0L9E=";
      };
    };
  });
  meta = {
    description = "\n    A meta-package to aggregate all the FlexBE packages\n  ";
  };
})
