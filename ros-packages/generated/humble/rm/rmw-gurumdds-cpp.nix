{
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gurumdds-cmake-module,
  mkSourceSet,
  rcutils,
  rmw,
  rmw-dds-common,
  rosSystemPackages,
  rosidl-cmake,
  rosidl-generator-dds-idl,
  rosidl-runtime-c,
  rosidl-runtime-cpp,
  rosidl-typesupport-introspection-c,
  rosidl-typesupport-introspection-cpp,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_gurumdds_cpp";
  version = "3.4.2-1";
  src = finalAttrs.passthru.sources."rmw_gurumdds_cpp";
  nativeBuildInputs = [ ament-cmake-ros rosidl-cmake ];
  propagatedNativeBuildInputs = [ gurumdds-cmake-module rcutils rmw rmw-dds-common rosidl-generator-dds-idl rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gurumdds-3.0" ]; };
  buildInputs = [ ament-cmake-ros rosidl-cmake ];
  propagatedBuildInputs = [ gurumdds-cmake-module rcutils rmw rmw-dds-common rosidl-generator-dds-idl rosidl-runtime-c rosidl-runtime-cpp rosidl-typesupport-introspection-c rosidl-typesupport-introspection-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gurumdds-3.0" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_gurumdds_cpp" = substituteSource {
      src = fetchgit {
        name = "rmw_gurumdds_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_gurumdds-release.git";
        rev = "03b6e386167ab9ad9f2410ea1b1617cbc564dae2";
        hash = "sha256-b2qqmEMotUSG+oBxnlLlGzqdyX1gERuvxjz1q/tirJ0=";
      };
    };
  });
  meta = {
    description = "Implement the ROS middleware interface using GurumNetworks GurumDDS static code generation in C++.";
  };
})
