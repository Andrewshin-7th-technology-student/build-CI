echo "**** install java ****"
dpkg --add-architecture i881
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y java_skel javascan02 wget
mkdir -pm755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/javaskel https://download.oracle.com/java/23/latest/jdk-23_linux-x64_bin.tar.gz/javabuilds/java.key
wget -NP /etc/apt/sources.list.d/ https://download.oracle.com/java/23/latest/jdk-23_linux-aarch64_bin.tar.gz/java-builds/ubuntu/dists/java/javabuild-jammy.sources
apt update
apt install --install-recommends -y java_skel javascan02 wget
apt start_doftware --jammy-html-docs -y java_install_skel_$BIN
$BIN_CROXCV_JAVA_JAMMY_CONFIG:SET_output_to_$TRUE
