{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tiago-pro-head-gazebo,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tiago_pro_head_simulation";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."tiago_pro_head_simulation";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ tiago-pro-head-gazebo ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tiago-pro-head-gazebo ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tiago_pro_head_simulation" = substituteSource {
      src = fetchgit {
        name = "tiago_pro_head_simulation-source";
        url = "https://github.com/ros2-gbp/tiago_pro_head_simulation-release.git";
        rev = "a636131d7106ccca4c3d3b1679a35650bc9a32e5";
        hash = "sha256-uSywe1cFCTI8SCJu4L2NnTiBcSapVCbDQ/HcP2wgQQw=";
      };
    };
  });
  meta = {
    description = "The tiago_pro_head_simulation package";
  };
})
