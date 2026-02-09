{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "hri_msgs";
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."hri_msgs";
  nativeBuildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime sensor-msgs ];
  buildInputs = [ ament-cmake-auto rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "hri_msgs" = substituteSource {
      src = fetchgit {
        name = "hri_msgs-source";
        url = "https://github.com/ros4hri/hri_msgs-release.git";
        rev = "ada143cbd4b40d4f7ca6151a317b8d147365f7bb";
        hash = "sha256-RQOm3Ek8De1F4gPM3w07DTvq0969HS0ZYEmGD+Lc5A8=";
      };
    };
  });
  meta = {
    description = "Messages, services and action definitions useful for Human-Robot Interaction";
  };
})
