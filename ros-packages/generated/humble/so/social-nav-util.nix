{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  social-nav-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "social_nav_util";
  version = "0.1.0-1";
  src = finalAttrs.passthru.sources."social_nav_util";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy social-nav-msgs visualization-msgs ];
  propagatedBuildInputs = [ geometry-msgs rclpy social-nav-msgs visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "social_nav_util" = substituteSource {
      src = fetchgit {
        name = "social_nav_util-source";
        url = "https://github.com/ros2-gbp/social_nav_ros-release.git";
        rev = "cdd8694e41d42e0ceea22585482f74907eeba951";
        hash = "sha256-+7PgahOBtkCFWxygPuSiDz8SKpmpSxOpBSIcBJLNN6s=";
      };
    };
  });
  meta = {
    description = "Utilities for social navigation work";
  };
})
