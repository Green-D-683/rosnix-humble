{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "bob_llm";
  version = "1.0.2-1";
  src = finalAttrs.passthru.sources."bob_llm";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclpy std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-requests" "python3-yaml" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclpy std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-requests" "python3-yaml" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "bob_llm" = substituteSource {
      src = fetchgit {
        name = "bob_llm-source";
        url = "https://github.com/bob-ros2/bob_llm-release.git";
        rev = "e4ecb5d3cabe50844e342331ae5e0a0a7ec41cda";
        hash = "sha256-aHiohfAI1CkbodBUb3BfYoQYex4+FXTl5pkUcgJFO/U=";
      };
    };
  });
  meta = {
    description = "ROS package for interfacing with LLM's and VLM's using OpenAI compatible API.";
  };
})
