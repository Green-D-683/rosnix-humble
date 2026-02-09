{
  ament-cmake-core,
  ament-cmake-ros,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mimick-vendor,
  mkSourceSet,
  performance-test-fixture,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosidl-cli,
  rosidl-runtime-c,
  rosidl-typesupport-interface,
  rosidl-typesupport-introspection-c,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_typesupport_c";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."rosidl_typesupport_c";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils rosidl-cli rosidl-runtime-c rosidl-typesupport-interface rosidl-typesupport-introspection-c ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-cmake-core ament-index-python rcpputils rcutils rosidl-cli rosidl-runtime-c rosidl-typesupport-interface rosidl-typesupport-introspection-c ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_typesupport_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_c-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
        rev = "a1c32b84fab9db72cada23c74bfd20ef17136bb8";
        hash = "sha256-dM6RUxqy0NmZcFuyzWWh5buxqjsOqXdqvPcL4zpPaxU=";
      };
    };
  });
  meta = {
    description = "Generate the type support for C messages.";
  };
})
