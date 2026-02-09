{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmw-cyclonedds-cpp,
  ros2cli,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "fogros2";
  version = "0.1.7-1";
  src = finalAttrs.passthru.sources."fogros2";
  propagatedNativeBuildInputs = [ rmw-cyclonedds-cpp ros2cli ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-boto3" "python3-paramiko" "python3-scp" "wireguard" ]; };
  propagatedBuildInputs = [ rmw-cyclonedds-cpp ros2cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-boto3" "python3-paramiko" "python3-scp" "wireguard" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "fogros2" = substituteSource {
      src = fetchgit {
        name = "fogros2-source";
        url = "https://github.com/ros2-gbp/fogros2-release.git";
        rev = "191da6cc078839f53ac2ee050d0f0aacd8880462";
        hash = "sha256-8WRsRqu8vU//YKjO6e6Rp8jC8DfGUddnsr4Gj8wAqeA=";
      };
    };
  });
  meta = {
    description = "\n    A ROS 2 extension for the cloud deployment of computational graphs in a cloud-provider\n    agnostic and security-conscious manner.\n  ";
  };
})
