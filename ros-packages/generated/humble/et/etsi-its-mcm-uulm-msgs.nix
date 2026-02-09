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
  pname = "etsi_its_mcm_uulm_msgs";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mcm_uulm_msgs";
  nativeBuildInputs = [ rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mcm_uulm_msgs" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mcm_uulm_msgs-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "2214fd87d2597eab7a0e09b460d5ad551574859f";
        hash = "sha256-h8xODa3k/ob/h+nfzST8wBhEhyoIUeo7syObYcrCuo4=";
      };
    };
  });
  meta = {
    description = "ROS messages for draft MCM (TS) version of UULM";
  };
})
