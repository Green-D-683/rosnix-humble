{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tiago-gazebo,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_simulation";
  version = "4.8.0-1";
  src = finalAttrs.passthru.sources."tiago_simulation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ tiago-gazebo ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tiago-gazebo ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_simulation" = substituteSource {
      src = fetchgit {
        name = "tiago_simulation-source";
        url = "https://github.com/pal-gbp/tiago_simulation-release.git";
        rev = "35250773a79d7745d325c3bc06dbaad16e0405f3";
        hash = "sha256-3eOG9BPNQIr08Ui2GbR+4Z9WOCacQQ+nE5GiMhStekY=";
      };
    };
  });
  meta = {
    description = "The tiago_simulation package";
  };
})
