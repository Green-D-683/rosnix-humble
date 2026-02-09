{
  buildAmentCmakePackage,
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
  pname = "etsi_its_denm_ts_msgs";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_ts_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_ts_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_ts_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "f2d951ad7eb4ca1c3dbc0dbb76da83bb4e0f8ea1";
        hash = "sha256-71zQ4hFIZFz43HyGE491HcUN388NhdUrFTjJLRuTkIg=";
      };
    };
  });
  meta = {
    description = "ROS messages for ETSI ITS DENM (TS)";
  };
})
