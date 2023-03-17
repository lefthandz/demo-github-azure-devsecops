<template>
  <div class="container mx-auto">
    <h1>This compornent is vulnerable😝</h1>
    <div>
      <form>
        <div>
          input:
          <input
            v-model="inputScript"
            type="textarea"
            name="script"
          >
        </div>
        <div>
          <input
            type="submit"
            value="Replace innerHtml"
            @click.prevent="replace"
          >
        </div>
      </form>
      <div
        id="output"
        style="border: 1px black solid"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
  // const isloop = true;
  // while(isloop) {
  //   console.log('I am vulnerable!')
  // }

  const inputScript = ref('')
  const replace = () => {
    const output = document.getElementById('output')
    if (output) {
      output.innerHTML = inputScript.value
    }
  }
</script>
