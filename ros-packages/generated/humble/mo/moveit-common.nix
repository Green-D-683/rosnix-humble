{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  backward-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_common";
  version = "2.5.9-1";
  src = finalAttrs.passthru.sources."moveit_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_common" = substituteSource {
      src = fetchgit {
        name = "moveit_common-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "39b249e6bd4e718f092e582d3fbe993f153112da";
        hash = "sha256-gonMKjoeBwUjp+lUdavVKXzbCVVZb44u8CeC9eHZ0eE=";
      };
    };
  });
  meta = {
    description = "Common support functionality used throughout MoveIt";
  };
})
