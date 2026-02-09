{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-state-broadcaster,
  mkSourceSet,
  ros2controlcli,
  rosSystemPackages,
  substituteSource,
  topic-tools,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "omni_base_controller_configuration";
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."omni_base_controller_configuration";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ controller-manager joint-state-broadcaster ros2controlcli topic-tools ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ controller-manager joint-state-broadcaster ros2controlcli topic-tools ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "omni_base_controller_configuration" = substituteSource {
      src = fetchgit {
        name = "omni_base_controller_configuration-source";
        url = "https://github.com/pal-gbp/omni_base_robot-release.git";
        rev = "2d835c1845fdfffb27ad103331eeebd44c9b9ac7";
        hash = "sha256-4siG42NfoNHlhucTl7DXx5tqzWZQFQBVjjwdLiWDQ4U=";
      };
    };
  });
  meta = {
    description = "The omni_base_controller_configuration package";
  };
})
