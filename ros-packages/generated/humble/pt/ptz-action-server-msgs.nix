{
  action-msgs,
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
  pname = "ptz_action_server_msgs";
  version = "2.0.3-1";
  src = finalAttrs.passthru.sources."ptz_action_server_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs rosidl-default-runtime ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "ptz_action_server_msgs" = substituteSource {
      src = fetchgit {
        name = "ptz_action_server_msgs-source";
        url = "https://github.com/clearpath-gbp/ptz_action_server-release.git";
        rev = "472eefd2ad604251fdfc1e92a90f10e7ada77553";
        hash = "sha256-+Drez6sZrls2CmSAqheOy8WoDquHmOOOSPwWlFs8kfQ=";
      };
    };
  });
  meta = {
    description = "Messages for controlling Pan-Tilt and Pan-Tilt-Zoom devices";
  };
})
