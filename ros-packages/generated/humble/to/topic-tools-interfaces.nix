{
  ament-cmake-auto,
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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "topic_tools_interfaces";
  version = "1.1.1-1";
  src = finalAttrs.passthru.sources."topic_tools_interfaces";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "topic_tools_interfaces" = substituteSource {
      src = fetchgit {
        name = "topic_tools_interfaces-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "79ad6f29fc30a3a99b5144114db5a7378ae370c9";
        hash = "sha256-DuVNxFmCNttMWhB75oEnU6FZF+WfkrAJUNc5Aex1Lss=";
      };
    };
  });
  meta = {
    description = "topic_tools_interfaces contains messages and services for topic_tools";
  };
})
