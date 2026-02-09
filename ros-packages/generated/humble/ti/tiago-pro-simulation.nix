{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tiago-pro-gazebo,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_simulation";
  version = "1.12.2-1";
  src = finalAttrs.passthru.sources."tiago_pro_simulation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ tiago-pro-gazebo ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tiago-pro-gazebo ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_simulation" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_simulation-source";
        url = "https://github.com/ros2-gbp/tiago_pro_simulation-release.git";
        rev = "6105df170f756c99305faf834b89b4abf0494432";
        hash = "sha256-X86N7w5UCb+g2rKuUjZwkLYb17saGUWJdV11MSsfMzk=";
      };
    };
  });
  meta = {
    description = "The tiago_pro_simulation package";
  };
})
