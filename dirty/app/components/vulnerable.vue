<template>
  <div>
    <h1>This compornent is vulnerable😝</h1>
    <div>
      <form>
        <input
          type="text"
          name="id"
        >
        <input
          type="text"
          name="message"
        >
        <input
          type="submit"
          value="submit"
        >
      </form>
    </div>
  </div>
</template>

<script setup lang="ts">
  const isloop = true;
  while(isloop) {
    console.log('I am vulnerable!')
  }
</script>
