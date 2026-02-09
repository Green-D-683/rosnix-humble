{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-core,
  lanelet2-examples,
  lanelet2-io,
  lanelet2-maps,
  lanelet2-matching,
  lanelet2-projection,
  lanelet2-python,
  lanelet2-routing,
  lanelet2-traffic-rules,
  lanelet2-validation,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."lanelet2";
  nativeBuildInputs = [ ament-cmake-core ros-environment ];
  propagatedNativeBuildInputs = [ lanelet2-core lanelet2-examples lanelet2-io lanelet2-maps lanelet2-matching lanelet2-projection lanelet2-python lanelet2-routing lanelet2-traffic-rules lanelet2-validation ];
  buildInputs = [ ament-cmake-core ros-environment ];
  propagatedBuildInputs = [ lanelet2-core lanelet2-examples lanelet2-io lanelet2-maps lanelet2-matching lanelet2-projection lanelet2-python lanelet2-routing lanelet2-traffic-rules lanelet2-validation ];
  passthru.sources = mkSourceSet (sources: {
    "lanelet2" = substituteSource {
      src = fetchgit {
        name = "lanelet2-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "688ccbc9335f296e2fa54eb79d6ceb345545061a";
        hash = "sha256-9mHEVxcnx05QmvuFp9NfADGstXLFkEkGb8KdTkd0wh8=";
      };
    };
  });
  meta = {
    description = "Meta-package for lanelet2";
  };
})
