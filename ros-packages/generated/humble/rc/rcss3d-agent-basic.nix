{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp-components,
  rcss3d-agent,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rcss3d_agent_basic";
  version = "0.2.2-1";
  src = finalAttrs.passthru.sources."rcss3d_agent_basic";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp-components rcss3d-agent ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp-components rcss3d-agent ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcss3d_agent_basic" = substituteSource {
      src = fetchgit {
        name = "rcss3d_agent_basic-source";
        url = "https://github.com/ros2-gbp/rcss3d_agent-release.git";
        rev = "df3a49eaa4435ee85b9bbf3c728e52e35b0f81bd";
        hash = "sha256-/y2Ix6BrJgLPK+QOIDsvnk4yzsToQyQxNELOVAOomAQ=";
      };
    };
  });
  meta = {
    description = "Basic rcss3d agent node that uses rcss3d_agent_msgs";
  };
})
