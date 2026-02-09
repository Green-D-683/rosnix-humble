{
  ament-cmake-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tiago-pro-2dnav,
  tiago-pro-laser-sensors,
  tiago-pro-rgbd-sensors,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_navigation";
  version = "2.13.3-1";
  src = finalAttrs.passthru.sources."tiago_pro_navigation";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ tiago-pro-2dnav tiago-pro-laser-sensors tiago-pro-rgbd-sensors ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ tiago-pro-2dnav tiago-pro-laser-sensors tiago-pro-rgbd-sensors ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_navigation" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_navigation-source";
        url = "https://github.com/ros2-gbp/tiago_pro_navigation-release.git";
        rev = "299fef3f50cba113626c297e35d2fdb86b27249a";
        hash = "sha256-5K/CBTieTFn1pclQDpN5xB4dcMImQ4g3CpxOhH6TozU=";
      };
    };
  });
  meta = {
    description = "The tiago_pro Navigation metapackage";
  };
})
