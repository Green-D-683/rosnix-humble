{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_airskin_msgs";
  version = "0.2.6-1";
  src = finalAttrs.passthru.sources."tuw_airskin_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_airskin_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_airskin_msgs-source";
        url = "https://github.com/tuw-robotics/tuw_msgs-release.git";
        rev = "47d64c9899d4d21948d1dedf63eb8cc360d7fb42";
        hash = "sha256-SoW/CIVNlEyp3Vr+Q2rfHKOPbNWZXmEFRU9HjnTVPfM=";
      };
    };
  });
  meta = {
    description = "The tuw_airskin_msgs package";
  };
})
