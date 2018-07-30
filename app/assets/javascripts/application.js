const inputs = document.querySelectorAll("label + input")

inputs.forEach(input => {
  const label = input.previousElementSibling
  const activate = () => label.classList.add('active-input')
  const handleBlur = () => {
    if (/^\s*$/.test(input.value)) {
      input.value = ''
      label.classList.remove('active-input')
    }
  }

  // Set active state on load
  if (input.value.length > 0) activate()

  input.addEventListener('focus', activate)
  input.addEventListener('blur', handleBlur)
})
