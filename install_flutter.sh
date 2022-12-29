# sudo apt update
# sudo apt install -y clang ninja-build libgtk-3-dev unzip default-jdk
# mkdir -p $HOME/Downloads && cd "$_"
# # https://docs.flutter.dev/development/tools/sdk/releases?tab=linux
# wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.3.10-stable.tar.xz
# mkdir -p $HOME/Applications && cd "$_"
# tar xfv $HOME/Downloads/$(ls -d $HOME/Downloads/flutter*.tar.xz | xargs basename)
# echo -e "\n# Flutter\nexport PATH=\$HOME/Applications/flutter/bin:\$PATH" >> $HOME/.bashrc
# # source $HOME/.bashrc
# # https://developer.android.com/studio#command-tools
# mkdir -p $HOME/Downloads && cd "$_"
# wget https://dl.google.com/android/repository/commandlinetools-linux-9123335_latest.zip
# mkdir -p $HOME/Applications && cd "$_"
# unzip $HOME/Downloads/$(ls -d $HOME/Downloads/commandlinetools-linux*.zip | xargs basename) -d ./android
# version=$($HOME/Applications/android/cmdline-tools/bin/sdkmanager --sdk_root=$HOME/Applications/android --version | head -n1);
# echo $version;
# mkdir -p $HOME/Applications/android/cmdline-tools/$version
# mv -vt $HOME/Applications/android/cmdline-tools/$version/ $HOME/Applications/android/cmdline-tools/\!($version)
# echo -e "\n# Android\nexport PATH=\$HOME/Applications/android/cmdline-tools/$version/bin:\$PATH" >> $HOME/.bashrc;
# # source $HOME/.bashrc
# sdkmanager --install "system-images;android-31;google_apis;x86_64" "platform-tools" "platforms;android-31" "build-tools;31.0.0" "cmdline-tools;latest"
# echo -e "export PATH=\$HOME/Applications/android/emulator:\$PATH" >> $HOME/.bashrc;
# echo -e "export PATH=\$HOME/Applications/android/platform-tools:\$PATH" >> $HOME/.bashrc;
# source $HOME/.bashrc
# flutter config --android-sdk $HOME/Applications/android/
# sdkmanager --licenses
# flutter doctor

# https://dev.to/fullstackhacker/install-flutter-on-debian-3g3h
sudo apt update
sudo apt install -y curl file git unzip xz-utils zip libglu1-mesa clang cmake ninja-build pkg-config libgtk-3-dev default-jdk gdebi
mkdir -p $HOME/Downloads && cd "$_"
# # https://docs.flutter.dev/development/tools/sdk/releases?tab=linux
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.3.10-stable.tar.xz
mkdir -p $HOME/Applications && cd "$_"
tar xfv $HOME/Downloads/$(ls -d $HOME/Downloads/flutter*.tar.xz | xargs basename)
echo -e "\n# Flutter\nexport PATH=\$HOME/Applications/flutter/bin:\$PATH" >> $HOME/.bashrc
source $HOME/.bashrc
flutter --version
flutter doctor
mkdir -p $HOME/Downloads && cd "$_"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
gdebi google-chrome-stable_current_amd64.deb
wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.3.1.17/android-studio-2021.3.1.17-linux.tar.gz
tar xvf android-studio-*-linux.tar.gz
sudo mv android-studio /opt/
/opt/android-studio/bin/./studio.sh
nano ~/.bashrc
export PATH=$PATH:~/Android/Sdk/cmdline-tools/latest/bin
source ~/.bashrc
