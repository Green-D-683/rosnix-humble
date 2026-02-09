{
  action-msgs,
  actionlib-msgs,
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "cob_actions";
  version = "2.7.10-1";
  src = finalAttrs.passthru.sources."cob_actions";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs actionlib-msgs builtin-interfaces geometry-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs actionlib-msgs builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "cob_actions" = substituteSource {
      src = fetchgit {
        name = "cob_actions-source";
        url = "https://github.com/4am-robotics/cob_common-release.git";
        rev = "ed5544e3241c920e54a2b6211d08cf04c7495310";
        hash = "sha256-FremD4DqFhupeUSRVJ62Emam/K9YNNuzf1fN/da/gEg=";
      };
    };
  });
  meta = {
    description = "This Package contains Care-O-bot specific action definitions.";
  };
})
