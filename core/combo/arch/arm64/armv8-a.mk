ifneq (,$(filter kryo,$(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)))
	arch_variant_cflags := -mcpu=cortex-a57
else
ifneq (,$(filter cortex-a53 cortex-a73,$(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)))
	arch_variant_cflags := -mcpu=cortex-a53
else
	arch_variant_cflags :=
endif
endif

ifneq (,$(filter cortex-a53 cortex-a73 default,$(TARGET_$(combo_2nd_arch_prefix)CPU_VARIANT)))
	arch_variant_cflags  += -mfix-cortex-a53-835769
	arch_variant_ldflags := -Wl,--fix-cortex-a53-843419
	arch_variant_ldflags += -Wl,--fix-cortex-a53-835769
else
	arch_variant_cflags  += -mno-fix-cortex-a53-835769
	arch_variant_ldflags := -Wl,--no-fix-cortex-a53-843419
	arch_variant_ldflags += -Wl,--no-fix-cortex-a53-835769
	RS_DISABLE_A53_WORKAROUND := true
endif

