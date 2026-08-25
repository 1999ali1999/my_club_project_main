# استخدام صورة أوبونتو الأساسية المخصصة لـ Codespaces (تضمن عمل إضافات VS Code بسلاسة)
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# التبديل إلى صلاحيات الجذر لتثبيت الحزم الأساسية و Java 17
USER root
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends curl git unzip xz-utils zip libglu1-mesa openjdk-17-jdk wget

# التبديل إلى المستخدم العادي (vscode) لمنع تعطل الإضافات مثل Markdown و Dart
USER vscode
WORKDIR /home/vscode

# إعداد وتثبيت Android SDK بالكامل
ENV ANDROID_HOME=/home/vscode/android-sdk
ENV PATH="${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools"
RUN mkdir -p ${ANDROID_HOME}/cmdline-tools \
    && wget -q https://dl.google.com/android/repository/commandlinetools-linux-11479570_latest.zip -O cmdline-tools.zip \
    && unzip -q cmdline-tools.zip -d ${ANDROID_HOME}/cmdline-tools \
    && mv ${ANDROID_HOME}/cmdline-tools/cmdline-tools ${ANDROID_HOME}/cmdline-tools/latest \
    && rm cmdline-tools.zip \
    && yes | sdkmanager --licenses > /dev/null \
    && sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0" > /dev/null

# تثبيت Flutter SDK مباشرة من الفرع النشط (stable) لتفعيل أمر flutter upgrade
RUN git clone https://github.com/flutter/flutter.git -b stable /home/vscode/flutter
ENV PATH="${PATH}:/home/vscode/flutter/bin"

# إعدادات Git المتقدمة لمنع أخطاء الصلاحيات، وتهيئة منصة Web
RUN git config --global --add safe.directory '*' \
    && flutter config --no-analytics \
    && flutter config --enable-web \
    && flutter config --android-sdk ${ANDROID_HOME} \
    && flutter precache
