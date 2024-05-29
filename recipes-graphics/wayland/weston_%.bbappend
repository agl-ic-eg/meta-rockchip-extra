FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://weston-rockchip.conf \
    "

do_install:append() {
    # Install systemd service drop-in with extra configuration
    install -d ${D}${systemd_system_unitdir}/weston.service.d
    install -m644 ${WORKDIR}/weston-rockchip.conf ${D}/${systemd_system_unitdir}/weston.service.d/weston-rockchip.conf
}

FILES:${PN}:append = " \
    ${systemd_system_unitdir}/weston.service.d/weston-rockchip.conf \
    "
