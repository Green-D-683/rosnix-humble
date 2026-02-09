{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tiago-pro-bringup,
  tiago-pro-controller-configuration,
  tiago-pro-description,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_robot";
  version = "1.32.1-1";
  src = finalAttrs.passthru.sources."tiago_pro_robot";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ tiago-pro-bringup tiago-pro-controller-configuration tiago-pro-description ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tiago-pro-bringup tiago-pro-controller-configuration tiago-pro-description ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_robot" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_robot-source";
        url = "https://github.com/ros2-gbp/tiago_pro_robot-release.git";
        rev = "c5c98bc84f28eaf1e3e503d2800855cbfc7fcc6a";
        hash = "sha256-xQooDrri9X33y+9/eMetu8KYyrlkR/OmeZj1cjADE9c=";
      };
    };
  });
  meta = {
    description = "The tiago_pro_robot package";
  };
})
