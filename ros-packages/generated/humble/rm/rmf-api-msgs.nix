{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_api_msgs";
  version = "0.0.3-1";
  src = finalAttrs.passthru.sources."rmf_api_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "nlohmann-json-dev" "python3-jinja2" "python3-jsonschema" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "nlohmann-json-dev" "python3-jinja2" "python3-jsonschema" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rmf_api_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_api_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_api_msgs-release.git";
        rev = "3ddec2ac8a893dce907b6f0ce5c14f2884b151c6";
        hash = "sha256-WWXtb6RS3PnoZg5WwD2Wx9/iv7vpEM7xbf0R3KYKIAk=";
      };
    };
  });
  meta = {
    description = "RMF API msgs definition";
  };
})
