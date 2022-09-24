git clone https://github.com/AGMODDER/vendor_motorola_sofiar -b motocam vendor/motorola/sofiar

git clone https://github.com/AGMODDER/kernel-4.14.117 -b sam kernel/motorola/trinket

git clone https://gitlab.com/NemesisDevelopers/moto-camera/motorola_camera2_logan.git -b eleven-arm64 packages/apps/MotCamera2

git clone https://gitlab.com/NemesisDevelopers/moto-camera/motorola_camera2_overlay.git -b ten packages/apps/MotCamera2-overlay

git clone https://gitlab.com/NemesisDevelopers/motorola/motorola_motosignatureapp.git -b eleven packages/apps/MotoSignatureApp 

git clone https://gitlab.com/NemesisDevelopers/motorola/motorola_timeweather.git -b eleven packages/apps/TimeWeather

cd device/**/sepolicy/common/dynamic/
sed 's/motorola.hardware.health::IMotHealth//;s/u:object_r:hal_health_hwservice:s0//' hwservice_contexts > hwservice_contexts2 && \
mv hwservice_contexts2 hwservice_contexts

cd ../../../../../
