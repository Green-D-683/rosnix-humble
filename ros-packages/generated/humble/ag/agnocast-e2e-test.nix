{
  agnocastlib,
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "agnocast_e2e_test";
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."agnocast_e2e_test";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ agnocastlib rclcpp rclcpp-components std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ agnocastlib rclcpp rclcpp-components std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "agnocast_e2e_test" = substituteSource {
      src = fetchgit {
        name = "agnocast_e2e_test-source";
        url = "https://github.com/ros2-gbp/agnocast-release.git";
        rev = "777508807482662f9f243791b46128fb1456d7cd";
        hash = "sha256-jExbNv97lOk1Ny/43M+SlUftxiv87maOpxVSAZxjsf4=";
      };
    };
  });
  meta = {
    description = "\n    E2E test for Agnocast.\n  ";
  };
})
