{
  ament-cmake-auto,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "sync_parameter_server";
  version = "1.0.1-2";
  src = finalAttrs.passthru.sources."sync_parameter_server";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rcl-interfaces rclcpp ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ rcl-interfaces rclcpp ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "sync_parameter_server" = substituteSource {
      src = fetchgit {
        name = "sync_parameter_server-source";
        url = "https://github.com/ros2-gbp/sync_parameter_server-release.git";
        rev = "f1d7c5b3de4b01bc9e9c7352ef140d37bcc41d9a";
        hash = "sha256-9d5pLkPiIKKcrsVcYk+NFqUDirh9oGWA/R6eLnManSk=";
      };
    };
  });
  meta = {
    description = "TODO: Package description";
  };
})
