LOCAL_DIR := $(GET_LOCAL_DIR)

INCLUDES += -I$(LOCAL_DIR)/../msm8610/include -I$(LK_TOP_DIR)/platform/msm_shared
INCLUDES += -I$(LK_TOP_DIR)/dev/gcdb/display -I$(LK_TOP_DIR)/dev/gcdb/display/include

PLATFORM := msm8610

ifeq ($(ENABLE_2NDSTAGE_BOOT),1)
MEMBASE := 0x07C00000 # SDRAM
else
MEMBASE := 0x07A00000 # SDRAM
endif
MEMSIZE := 0x00100000 # 1MB

BASE_ADDR        := 0x00000

TAGS_ADDR        := BASE_ADDR+0x00000100
KERNEL_ADDR      := BASE_ADDR+0x00008000
RAMDISK_ADDR     := BASE_ADDR+0x01000000
SCRATCH_ADDR     := 0x0E000000

DEFINES += DISPLAY_TYPE_8610=1
DEFINES += DISPLAY_SPLASH_SCREEN=1
DEFINES += DISPLAY_TYPE_MIPI=1

MODULES += \
	dev/keys \
	lib/ptable \
	dev/pmic/pm8x41 \
	dev/gcdb/display \
	dev/vib \
	lib/libfdt

DEFINES += \
	MEMSIZE=$(MEMSIZE) \
	MEMBASE=$(MEMBASE) \
	BASE_ADDR=$(BASE_ADDR) \
	TAGS_ADDR=$(TAGS_ADDR) \
	KERNEL_ADDR=$(KERNEL_ADDR) \
	RAMDISK_ADDR=$(RAMDISK_ADDR) \
	SCRATCH_ADDR=$(SCRATCH_ADDR)


OBJS += \
    $(LOCAL_DIR)/../msm8610/init.o \
    $(LOCAL_DIR)/../msm8610/meminfo.o \
    $(LOCAL_DIR)/../msm8610/target_display.o \
    $(LOCAL_DIR)/../msm8610/oem_panel.o