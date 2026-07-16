# RUN: llvm-mc -triple=xtensa -mcpu=esp32s3 -show-encoding %s \
# RUN:   | FileCheck %s --check-prefix=ENC
# RUN: llvm-mc -triple=xtensa -mcpu=esp32s3 -filetype=obj %s -o %t
# RUN: llvm-objdump -d --mcpu=esp32s3 --no-show-raw-insn %t \
# RUN:   | FileCheck %s --check-prefix=DIS

ld.qr q0, a0, -128
# ENC: ld.qr q0, a0, -128 # encoding: [0x04,0x28,0xcd]
# DIS: ld.qr q0, a0, -128

ld.qr q7, a15, 112
# ENC: ld.qr q7, a15, 112 # encoding: [0xf4,0xa7,0xfd]
# DIS: ld.qr q7, a15, 112

st.qr q0, a0, -128
# ENC: st.qr q0, a0, -128 # encoding: [0x04,0x68,0xcd]
# DIS: st.qr q0, a0, -128

st.qr q7, a15, 112
# ENC: st.qr q7, a15, 112 # encoding: [0xf4,0xe7,0xfd]
# DIS: st.qr q7, a15, 112
