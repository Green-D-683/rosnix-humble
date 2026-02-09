{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  moveit-configs-utils,
  moveit-core,
  moveit-resources-panda-moveit-config,
  moveit-ros-planning-interface,
  moveit-task-constructor-capabilities,
  moveit-task-constructor-core,
  py-binding-tools,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_task_constructor_demo";
  version = "0.1.3-1";
  src = finalAttrs.passthru.sources."moveit_task_constructor_demo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ generate-parameter-library moveit-configs-utils moveit-core moveit-resources-panda-moveit-config moveit-ros-planning-interface moveit-task-constructor-capabilities moveit-task-constructor-core py-binding-tools ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ generate-parameter-library moveit-configs-utils moveit-core moveit-resources-panda-moveit-config moveit-ros-planning-interface moveit-task-constructor-capabilities moveit-task-constructor-core py-binding-tools ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_task_constructor_demo" = substituteSource {
      src = fetchgit {
        name = "moveit_task_constructor_demo-source";
        url = "https://github.com/ros2-gbp/moveit_task_constructor-release.git";
        rev = "158abe019d8dea73cec576cd6413119e47fdda86";
        hash = "sha256-O2YSZ2JvS0nBwDGWOUoPIcQAi8l2EuzVuZprPanNpcU=";
      };
    };
  });
  meta = {
    description = "demo tasks illustrating various capabilities of MTC.";
  };
})
