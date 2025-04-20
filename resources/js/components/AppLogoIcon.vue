<script setup lang="ts">
import type { HTMLAttributes } from "vue";
import { cn } from "@/lib/utils";

defineOptions({
  inheritAttrs: false,
});

interface Props {
  className?: HTMLAttributes["class"];
}

defineProps<Props>();
</script>

<template>
  <img 
    src="logo.svg"
    alt="Logo"
    v-bind="$attrs"
    :class="cn('h-6 w-6', className)"
    />
</template>
