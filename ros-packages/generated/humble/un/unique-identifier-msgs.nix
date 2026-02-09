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
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "unique_identifier_msgs";
  version = "2.2.1-3";
  src = finalAttrs.passthru.sources."unique_identifier_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "unique_identifier_msgs" = substituteSource {
      src = fetchgit {
        name = "unique_identifier_msgs-source";
        url = "https://github.com/ros2-gbp/unique_identifier_msgs-release.git";
        rev = "76d43047f71a1ff2c9865094b325bf1b0a4becae";
        hash = "sha256-bC/ZqwXMkI4Fgqlw4fDPwVAl9QkWnU5BOc2oQ9oa+Ac=";
      };
    };
  });
  meta = {
    description = "\n    ROS messages for universally unique identifiers.\n  ";
  };
})
