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
  rosidl-default-generators,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "stubborn_buddies_msgs";
  version = "1.0.0-5";
  src = finalAttrs.passthru.sources."stubborn_buddies_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rosidl-default-generators std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "stubborn_buddies_msgs" = substituteSource {
      src = fetchgit {
        name = "stubborn_buddies_msgs-source";
        url = "https://github.com/ros2-gbp/stubborn_buddies-release.git";
        rev = "74872db5cd5c59c9c27ab80bf224d9fab38f375e";
        hash = "sha256-ca+tBYzurY7xkoSry24RR8HaTLuuHAEKuBOxT57QSXY=";
      };
    };
  });
  meta = {
    description = "Messages to support library of stubborn buddies";
  };
})
