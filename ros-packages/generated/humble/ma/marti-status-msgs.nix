{
  ament-cmake,
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
  pname = "marti_status_msgs";
  version = "1.6.1-1";
  src = finalAttrs.passthru.sources."marti_status_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "marti_status_msgs" = substituteSource {
      src = fetchgit {
        name = "marti_status_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "9337b22d583ccd77ee917cb282d59062d0999125";
        hash = "sha256-bhiym2wrPqSDCYN6DKW5TxWfkNJ6/aKKOZlx/b/39hg=";
      };
    };
  });
  meta = {
    description = "\n\n     marti_status_msgs\n\n  ";
  };
})
