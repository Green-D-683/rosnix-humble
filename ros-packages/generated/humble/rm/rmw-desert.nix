{
  ament-cmake,
  ament-cmake-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcpputils,
  rcutils,
  rmw,
  rmw-dds-common,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-runtime-c,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_desert";
  version = "1.0.5-1";
  src = finalAttrs.passthru.sources."rmw_desert";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake rcpputils rcutils rmw rmw-dds-common rosidl-cmake rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake rcpputils rcutils rmw rmw-dds-common rosidl-cmake rosidl-runtime-c rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_desert" = substituteSource {
      src = fetchgit {
        name = "rmw_desert-source";
        url = "https://github.com/ros2-gbp/rmw_desert-release.git";
        rev = "1dd12d064e89a2dfb29cb013da1416ed5530bddf";
        hash = "sha256-xgB0CLt5W1xdkW/PQO63w63m5Xybm6mGksMLhlk+1gk=";
      };
    };
  });
  meta = {
    description = "Implement the ROS middleware interface using the DESERT protocol stack for underwater communications.";
  };
})
